| Step | Description |
|------|-------------|
| 1    | Create an EKS Cluster |
| 2    | Create IAM Role for the EKS Cluster |
| 3    | Create a Node Group |
| 4    | Create IAM Role for Worker Nodes |
| 5    | Add VPC CNI Add-On |
| 6    | Configure OIDC Provider |
| 7    | Configure Identity Provider |
| 8    | Create IAM Role for Cluster Autoscaler |
| 9    | Create IAM Policy for Cluster Autoscaler |
| 10   | Attach Autoscaler Policy to Role |

# Documentation for EKS Cluster Setup

This section provides a generic guide to creating an Amazon EKS cluster and its associated resources.

## Steps to Set Up an EKS Cluster

### 1. Create an EKS Cluster
- **Resource**: `aws_eks_cluster`
- **Key Requirements**:
    - Define a unique cluster name.
    - Specify an IAM role with permissions for EKS management.
    - Provide subnet IDs for the VPC.
    - Enable necessary cluster log types (e.g., `audit`).
    - Specify the Kubernetes version.

### 2. Create IAM Role for the EKS Cluster
- **Resource**: `aws_iam_role`
- **Key Requirements**:
    - Define a policy document allowing EKS to assume the role.
    - Attach managed policies such as `AmazonEKSClusterPolicy` and `AmazonEKSVPCResourceController`.

### 3. Create a Node Group
- **Resource**: `aws_eks_node_group`
- **Key Requirements**:
    - Specify the cluster name and node group name.
    - Provide an IAM role for worker nodes.
    - Define subnet IDs and instance types.
    - Configure scaling parameters (desired, max, and min sizes).

### 4. Create IAM Role for Worker Nodes
- **Resource**: `aws_iam_role`
- **Key Requirements**:
    - Define a policy document allowing EC2 instances to assume the role.
    - Attach managed policies such as `AmazonEKSWorkerNodePolicy`, `AmazonEKS_CNI_Policy`, and `AmazonEC2ContainerRegistryReadOnly`.

### 5. Add VPC CNI Add-On
- **Resource**: `aws_eks_addon`
- **Key Requirements**:
    - Specify the cluster name.
    - Enable network policies if required.

### 6. Configure OIDC Provider
- **Resources**:
    - Use an external program to fetch the OIDC thumbprint.
    - Configure the OIDC provider using the cluster's issuer URL and thumbprint.

### 7. Configure Identity Provider
- **Resource**: `aws_eks_identity_provider_config`
- **Key Requirements**:
    - Use the OIDC client ID and issuer URL.
    - Define a unique identity provider configuration name.

### 8. Create IAM Role for Cluster Autoscaler
- **Resource**: `aws_iam_role`
- **Key Requirements**:
    - Define a policy document allowing Web Identity-based role assumption.
    - Restrict access to the `cluster-autoscaler` service account.

### 9. Create IAM Policy for Cluster Autoscaler
- **Resource**: `aws_iam_policy`
- **Key Requirements**:
    - Grant permissions for managing Auto Scaling Groups, EC2 instances, and EKS node groups.
    - Allow scaling and instance termination actions.

### 10. Attach Autoscaler Policy to Role
- **Resource**: `aws_iam_role_policy_attachment`
- **Key Requirements**:
    - Attach the autoscaler policy to the IAM role created for the cluster autoscaler.

This generic guide can be adapted to create new configurations by modifying the resource names, parameters, and policies as needed.
---


### 1. Create an EKS Cluster
```hcl
resource "aws_eks_cluster" "example" {
    name                      = "example"
    role_arn                  = aws_iam_role.example.arn
    enabled_cluster_log_types = ["audit"]
    version                   = "1.30"

    vpc_config {
        subnet_ids = ["subnet-0f38eb451cbdf6710", "subnet-00542a478baa8a55c"]
    }
}
```

### 2. Create IAM Role for the EKS Cluster
```hcl
data "aws_iam_policy_document" "assume_role" {
    statement {
        effect = "Allow"

        principals {
            type        = "Service"
            identifiers = ["eks.amazonaws.com"]
        }

        actions = ["sts:AssumeRole"]
    }
}

resource "aws_iam_role" "example" {
    name               = "eks-cluster-example"
    assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSClusterPolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role       = aws_iam_role.example.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSVPCResourceController" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
    role       = aws_iam_role.example.name
}
```

### 3. Create a Node Group
```hcl
resource "aws_eks_node_group" "example" {
    depends_on      = [aws_eks_addon.vpc-cni]
    cluster_name    = aws_eks_cluster.example.name
    node_group_name = "example"
    node_role_arn   = aws_iam_role.node-example.arn
    subnet_ids      = ["subnet-0f38eb451cbdf6710", "subnet-00542a478baa8a55c"]
    instance_types  = ["t3.large"]
    capacity_type   = "SPOT"

    scaling_config {
        desired_size = 1
        max_size     = 5
        min_size     = 1
    }
}
```

### 4. Create IAM Role for Worker Nodes
```hcl
resource "aws_iam_role" "node-example" {
    name = "eks-node-group-example"

    assume_role_policy = jsonencode({
        Statement = [{
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
                Service = "ec2.amazonaws.com"
            }
        }]
        Version = "2012-10-17"
    })
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSWorkerNodePolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role       = aws_iam_role.node-example.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKS_CNI_Policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role       = aws_iam_role.node-example.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEC2ContainerRegistryReadOnly" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role       = aws_iam_role.node-example.name
}
```

### 5. Add VPC CNI Add-On
```hcl
resource "aws_eks_addon" "vpc-cni" {
    cluster_name = aws_eks_cluster.example.name
    addon_name   = "vpc-cni"

    configuration_values = jsonencode({
        "enableNetworkPolicy" : "true"
    })
}
```

### 6. Configure OIDC Provider
```hcl
data "external" "oidc-thumbprint" {
    program = [
        "/usr/bin/kubergrunt", "eks", "oidc-thumbprint", "--issuer-url", "${aws_eks_cluster.example.identity[0].oidc[0].issuer}"
    ]
}

resource "aws_iam_openid_connect_provider" "eks" {
    url = aws_eks_cluster.example.identity[0].oidc[0].issuer

    client_id_list = [
        "sts.amazonaws.com",
    ]

    thumbprint_list = [data.external.oidc-thumbprint.result.thumbprint]
}
```

### 7. Configure Identity Provider
```hcl
locals {
    eks_client_id = element(tolist(split("/", tostring(aws_eks_cluster.example.identity[0].oidc[0].issuer))), 4)
}

resource "aws_eks_identity_provider_config" "example" {
    cluster_name = aws_eks_cluster.example.name

    oidc {
        client_id                     = local.eks_client_id
        identity_provider_config_name = "iam-oidc"
        issuer_url                    = aws_eks_cluster.example.identity[0].oidc[0].issuer
    }
}
```

### 8. Create IAM Role and Policy for Cluster Autoscaler
```hcl
resource "aws_iam_role" "eks-cluster-autoscale" {
    name = "eks-cluster-autoscale"

    assume_role_policy = jsonencode({
        "Version" : "2012-10-17",
        "Statement" : [
            {
                "Effect" : "Allow",
                "Action" : "sts:AssumeRoleWithWebIdentity",
                "Principal" : {
                    "Federated" : "arn:aws:iam::739561048503:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/${local.eks_client_id}"
                },
                "Condition" : {
                    "StringEquals" : {
                        "oidc.eks.us-east-1.amazonaws.com/id/${local.eks_client_id}:aud" : "sts.amazonaws.com",
                        "oidc.eks.us-east-1.amazonaws.com/id/${local.eks_client_id}:sub" : "system:serviceaccount:kube-system:cluster-autoscaler"
                    }
                }
            }
        ]
    })

    tags = {
        Name = "eks-cluster-autoscale"
    }
}

resource "aws_iam_policy" "cluster-autoscale" {
    name        = "cluster-autoscale"
    path        = "/"
    description = "cluster-autoscale"

    policy = jsonencode({
        "Version" : "2012-10-17",
        "Statement" : [
            {
                "Effect" : "Allow",
                "Action" : [
                    "autoscaling:DescribeAutoScalingGroups",
                    "autoscaling:DescribeAutoScalingInstances",
                    "autoscaling:DescribeLaunchConfigurations",
                    "autoscaling:DescribeScalingActivities",
                    "autoscaling:DescribeTags",
                    "ec2:DescribeImages",
                    "ec2:DescribeInstanceTypes",
                    "ec2:DescribeLaunchTemplateVersions",
                    "ec2:GetInstanceTypesFromInstanceRequirements",
                    "eks:DescribeNodegroup"
                ],
                "Resource" : ["*"]
            },
            {
                "Effect" : "Allow",
                "Action" : [
                    "autoscaling:SetDesiredCapacity",
                    "autoscaling:TerminateInstanceInAutoScalingGroup"
                ],
                "Resource" : ["*"]
            }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "cluster-autoscale" {
    policy_arn = aws_iam_policy.cluster-autoscale.arn
    role       = aws_iam_role.eks-cluster-autoscale.name
}
```

This Terraform configuration provides a complete setup for an EKS cluster, including IAM roles, node groups, and autoscaling. Adjust the resource names, subnet IDs, and other parameters as needed for your environment.
