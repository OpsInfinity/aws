resource "aws_eks_cluster" "eks" {
  name = "${var.env}-${var.project_name}-cluster"
  role_arn = aws_iam_role.iam_role.arn
  version  = "1.31"

  vpc_config {
    subnet_ids = var.subnet_ids
  }
 
}

resource "aws_iam_role" "iam_role" {
  name = "${var.env}-${var.project_name}-cluster-role"
  assume_role_policy = jsonencode({ 
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster.name
}
resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSVPCResourceController" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
    role       = aws_iam_role.cluster.name 
}

