Here are the top 10 Ansible interview questions that you might encounter with 3 years of experience:

### 1. **What is Ansible, and how does it differ from other automation tools like Puppet and Chef?**
   - **Key Points**: Ansible is an open-source IT automation tool that automates configuration management, application deployment, and task automation. It uses YAML for defining automation processes in playbooks, which is simpler compared to other tools like Puppet and Chef that use domain-specific languages (DSL).

### 2. **Explain the concept of an Ansible Playbook. How do you write a basic one?**
   - **Key Points**: A playbook is a file containing a series of plays, and each play defines the tasks to be executed on the hosts. The playbook is written in YAML format. You can write a simple playbook with tasks such as updating a package or copying a file.

### 3. **What are Ansible roles?**
   - **Key Points**: An Ansible role is a way of organizing tasks, variables, files, templates, and handlers into reusable units. Roles are stored in a specific directory structure, which Ansible recognizes for efficient task execution.

### 4. **What are Ansible Inventory files, and how do they work?**
   - **Key Points**: An inventory file defines the list of hosts that Ansible will manage. It can be static (a simple text file with hostnames or IPs) or dynamic (using scripts or plugins to query infrastructure).

### 5. **How does Ansible handle variables?**
   - **Key Points**: Ansible uses variables to customize playbooks. Variables can be defined in several places: in playbooks, inventory files, or in external files (such as YAML or JSON). You can also use facts and lookups to define variables dynamically.

### 6. **Explain Ansible’s idempotency.**
   - **Key Points**: Ansible is idempotent, meaning running the same playbook multiple times will not change the system if the desired state is already achieved. It ensures that tasks are only executed when necessary.

### 7. **How do you handle error handling in Ansible?**
   - **Key Points**: Ansible provides mechanisms for error handling, such as `ignore_errors`, `failed_when`, and `block`/`rescue`/`always` constructs. These can be used to prevent failures from blocking the execution of the playbook or to perform cleanup tasks.

### 8. **What is Ansible Galaxy?**
   - **Key Points**: Ansible Galaxy is a community-driven platform for sharing Ansible roles and collections. You can download, share, or publish roles and use them to speed up your automation tasks.

### 9. **How do you manage sensitive data (such as passwords) in Ansible?**
   - **Key Points**: Ansible uses Ansible Vault to encrypt sensitive data. This allows you to store secrets, such as passwords or API keys, in an encrypted form and decrypt them during playbook execution.

### 10. **Can you explain Ansible’s architecture?**
   - **Key Points**: Ansible follows a masterless architecture, meaning there is no need for an agent on the managed nodes. Ansible uses SSH to communicate with nodes, and the control node (where you run Ansible commands) sends tasks to the managed nodes.

---

These questions are designed to test both your practical knowledge and theoretical understanding of Ansible. They can also help interviewers gauge how you approach automation, troubleshooting, and scaling Ansible in a production environment.
---
Here are the top 10 **Terraform interview questions** that are commonly asked for candidates with **3 years of experience**:

### 1. **What is Terraform, and what are its key features?**
   - **Key Points**: Terraform is an open-source Infrastructure as Code (IaC) tool that allows you to define and provision infrastructure using a declarative configuration language (HCL). Key features include idempotency, multi-cloud support, modularity, and the ability to manage resources in a version-controlled manner.

### 2. **How does Terraform work?**
   - **Key Points**: Terraform works by defining infrastructure in configuration files. It then uses a two-step process: 
     - **Plan**: Terraform compares the current state of the infrastructure with the desired state defined in configuration files.
     - **Apply**: Terraform applies the changes needed to reach the desired state.
   Terraform uses a state file to keep track of the infrastructure’s current state.

### 3. **What is a Terraform provider?**
   - **Key Points**: A **provider** is a plugin in Terraform that allows interaction with an API or a service (like AWS, Azure, or Cloudflare). Providers are responsible for managing resources and exposing their capabilities as Terraform resources.

### 4. **What is a Terraform module?**
   - **Key Points**: A **module** is a container for multiple resources that are used together. Modules can be reused across projects and help in organizing your Terraform code. You can use both local and remote modules (from Terraform Registry) to simplify your codebase and promote reusability.

### 5. **What is the difference between `terraform plan` and `terraform apply`?**
   - **Key Points**: 
     - `terraform plan`: This command generates an execution plan, showing what actions Terraform will take to reach the desired state (without actually making any changes).
     - `terraform apply`: This command applies the changes required to achieve the desired state, based on the plan generated.

### 6. **How do you handle sensitive data in Terraform?**
   - **Key Points**: Terraform provides several ways to manage sensitive data:
     - Use the `sensitive = true` argument in resource definitions to hide outputs.
     - Use **Terraform Vault** or **AWS Secrets Manager** to store sensitive data.
     - Avoid hardcoding secrets directly in configuration files.

### 7. **What is the Terraform state file, and how is it used?**
   - **Key Points**: The **state file** keeps track of the current state of the infrastructure and is critical for Terraform's operation. It allows Terraform to understand what resources it has already created and their current attributes. This file should be stored securely and can be shared using remote backends like **S3** or **Azure Blob Storage**.

### 8. **What are Terraform backends?**
   - **Key Points**: **Backends** define where Terraform's state is stored. They can be local (on your machine) or remote (e.g., **AWS S3**, **Azure Storage**, **Terraform Cloud**). Using a remote backend allows teams to collaborate by sharing the same state file and ensures that infrastructure changes are tracked properly.

### 9. **How do you manage dependencies between resources in Terraform?**
   - **Key Points**: Terraform manages dependencies automatically using the graph-based approach, where it determines the execution order based on resource dependencies. You can explicitly define dependencies using the `depends_on` argument to control resource order manually if needed.

### 10. **What are the different ways to pass variables in Terraform?**
   - **Key Points**: Terraform supports several ways to pass variables:
     - **Environment variables**: Set variables in the shell (e.g., `TF_VAR_variable_name`).
     - **Command-line arguments**: Use the `-var` flag to pass variables.
     - **Variable files**: Store variables in `.tfvars` files and pass them during execution.
     - **Inline definitions**: Define variables directly in the configuration files.

---

These questions cover a broad range of Terraform concepts, from the fundamentals to more advanced usage, and can help interviewers assess your depth of knowledge and practical skills with Terraform. With three years of experience, you'll likely be expected to discuss best practices, complex resource configurations, and troubleshooting techniques.

----
Here are the **top 10 Jenkins interview questions** that are typically asked for candidates with **3 years of experience**:

### 1. **What is Jenkins, and why is it used?**
   - **Key Points**: Jenkins is an open-source automation server primarily used for Continuous Integration (CI) and Continuous Delivery (CD). It allows you to automate various stages of software development, including building, testing, and deploying applications. Jenkins helps improve collaboration, speed up releases, and ensure quality.

### 2. **What is the difference between Continuous Integration (CI) and Continuous Deployment (CD)?**
   - **Key Points**: 
     - **Continuous Integration (CI)** focuses on the automatic integration of code into a shared repository frequently (multiple times a day). It ensures that the code base is always in a working state.
     - **Continuous Deployment (CD)** goes a step further and automates the entire process of pushing code to production once it has passed all tests and checks.

### 3. **What are Jenkins Pipelines?**
   - **Key Points**: Jenkins Pipelines are a series of automated steps that define the stages of your CI/CD workflow. A pipeline is written in **Jenkinsfile** (using Groovy or Declarative syntax). Pipelines provide a more flexible and powerful way of defining automation compared to Freestyle projects, allowing complex workflows like parallel execution, input steps, and integration with other tools.

### 4. **Explain the difference between Freestyle projects and Pipelines in Jenkins.**
   - **Key Points**: 
     - **Freestyle projects** are simpler to set up, typically used for basic automation tasks like compiling code or running tests. However, they lack advanced features like version control and flexibility.
     - **Pipelines** provide more flexibility and control over the entire workflow and allow for the definition of complex automation tasks. Pipelines can be written in code (Jenkinsfile) and can include various stages, conditions, and even triggers for automated deployments.

### 5. **How do you create a Jenkins job?**
   - **Key Points**: You can create a Jenkins job by:
     1. Clicking on **New Item** in the Jenkins dashboard.
     2. Selecting the type of job (e.g., Freestyle project, Pipeline).
     3. Configuring the job settings, such as source code repository (Git), build triggers, build steps (commands to run), and post-build actions.
     4. Saving and running the job.

### 6. **How does Jenkins integrate with version control systems (e.g., Git, SVN)?**
   - **Key Points**: Jenkins can integrate with version control systems like **Git** or **SVN** using plugins like the **Git plugin** or **Subversion plugin**. These plugins allow Jenkins to pull the latest code from repositories, trigger builds based on changes, and provide feedback on the status of builds through the Jenkins UI.

### 7. **What is a Jenkinsfile?**
   - **Key Points**: A **Jenkinsfile** is a text file containing the definition of a Jenkins pipeline. It is typically stored in the version control system (e.g., Git) and can define a series of stages (like build, test, deploy). Jenkinsfiles can be written in either **Declarative** or **Scripted** syntax.

### 8. **What are Jenkins Agents, and how do they work?**
   - **Key Points**: **Jenkins Agents** (or **Slaves**) are machines that help offload builds from the Jenkins master. They can be configured to run specific types of jobs or execute specific steps. Jenkins master delegates tasks to agents, and agents can run jobs in parallel to improve build efficiency and scalability.

### 9. **How do you handle failures in Jenkins jobs?**
   - **Key Points**: Jenkins provides several mechanisms for handling job failures:
     - **Post-build actions** like notifications (email, Slack) to inform stakeholders.
     - **Retry logic**: You can configure certain steps to retry upon failure.
     - **Conditional logic**: Using Groovy or other scripts in the Jenkinsfile to execute steps only under certain conditions (e.g., if previous steps succeed).
     - **Pipeline**: Use `catchError` or `try-catch-finally` blocks for better error handling in Jenkins Pipelines.

### 10. **How can you secure Jenkins and its jobs?**
   - **Key Points**: Securing Jenkins is crucial to prevent unauthorized access and protect sensitive data. Some key practices include:
     - **Authentication**: Configure Jenkins to use authentication mechanisms like LDAP, Active Directory, or Jenkins own user database.
     - **Authorization**: Use Role-Based Access Control (RBAC) or Matrix-based security to restrict permissions on jobs, views, and other Jenkins resources.
     - **Encryption**: Use HTTPS to secure communication between Jenkins and other services.
     - **Credentials Management**: Store sensitive credentials securely using Jenkins credentials plugin, and avoid hardcoding credentials in jobs or pipelines.

---

These questions aim to cover your understanding of Jenkins' functionality, from basic job creation to advanced topics like pipeline creation, error handling, and security. With **3 years of experience**, you should be able to explain how to effectively set up Jenkins, implement pipelines, and troubleshoot common issues that may arise in production environments.
---

Here are the **top 10 Docker interview questions** that are commonly asked for candidates with **3 years of experience**:

### 1. **What is Docker, and what are its main components?**
   - **Key Points**: Docker is an open-source platform used to automate the deployment, scaling, and management of applications in containers. The main components are:
     - **Docker Engine**: The runtime that builds and runs containers.
     - **Docker Images**: Read-only templates used to create containers.
     - **Docker Containers**: The instances of Docker images that run applications.
     - **Docker Hub**: A cloud-based registry where you can share and download Docker images.
     - **Dockerfile**: A script used to build Docker images.

### 2. **What is a Docker image, and how is it different from a Docker container?**
   - **Key Points**: 
     - **Docker Image**: A lightweight, read-only template used to create containers. Images are the blueprint or the "snapshot" of an application and its environment.
     - **Docker Container**: A running instance of a Docker image. Containers are isolated, but they share the host OS kernel, making them lightweight compared to virtual machines.

### 3. **What is a Dockerfile, and how do you use it?**
   - **Key Points**: A **Dockerfile** is a text file containing instructions on how to build a Docker image. It typically includes commands like `FROM` (base image), `RUN` (commands to execute), `COPY` (copy files), `EXPOSE` (port to expose), and `CMD` (default command to run in the container).

   Example:
   ```dockerfile
   FROM ubuntu:latest
   RUN apt-get update && apt-get install -y curl
   COPY . /app
   EXPOSE 80
   CMD ["python", "app.py"]
   ```

### 4. **What is the difference between `docker run` and `docker exec`?**
   - **Key Points**:
     - `docker run`: Starts a new container from an image and runs a specified command.
     - `docker exec`: Runs a command in an already running container.

   Example:
   - `docker run ubuntu echo "Hello, World!"` (creates and runs a container)
   - `docker exec -it mycontainer bash` (executes bash in an already running container)

### 5. **How do you handle persistent data in Docker containers?**
   - **Key Points**: Docker containers are ephemeral, meaning their data is lost when the container stops. To handle persistent data, you can use:
     - **Docker Volumes**: Managed by Docker, they persist even when containers are removed.
     - **Bind Mounts**: A file or directory from the host is mounted into the container.
     - **Named Volumes**: These are similar to volumes but can be reused across multiple containers.

   Example:
   ```bash
   docker run -v /host/data:/container/data myimage
   ```

### 6. **What is the difference between `COPY` and `ADD` in a Dockerfile?**
   - **Key Points**:
     - `COPY`: Copies files or directories from the host to the container’s filesystem.
     - `ADD`: Similar to `COPY` but has additional features like extracting compressed files (e.g., `.tar`) and fetching remote files via HTTP or FTP.

   Example:
   ```dockerfile
   COPY ./localfile /containerfile
   ADD http://example.com/file.tar /containerfile
   ```

### 7. **What are Docker Networks, and how do you use them?**
   - **Key Points**: Docker networks allow containers to communicate with each other and with the outside world. Docker provides several types of networks:
     - **Bridge**: Default network, used when no other network is specified.
     - **Host**: Shares the host’s network stack.
     - **Overlay**: Used for multi-host communication (in Docker Swarm).
     - **None**: No networking; isolated from the outside world.

   Example to create and use a custom network:
   ```bash
   docker network create mynetwork
   docker run --network=mynetwork myimage
   ```

### 8. **What is Docker Compose, and how do you use it?**
   - **Key Points**: Docker Compose is a tool for defining and running multi-container Docker applications. It uses a YAML file (`docker-compose.yml`) to configure the services, networks, and volumes required by your application. It simplifies running multiple containers with one command.

   Example:
   ```yaml
   version: '3'
   services:
     web:
       image: nginx
       ports:
         - "8080:80"
     db:
       image: mysql
       environment:
         MYSQL_ROOT_PASSWORD: password
   ```

   To run:
   ```bash
   docker-compose up
   ```

### 9. **How do you monitor and troubleshoot Docker containers?**
   - **Key Points**:
     - Use `docker logs <container>` to view container logs.
     - Use `docker stats` to view real-time resource usage (CPU, memory, network I/O).
     - `docker ps` and `docker top` can help you list running containers and their processes.
     - Use `docker inspect` for detailed information about a container.
     - For troubleshooting, you can also attach to running containers with `docker exec -it <container_id> bash`.

### 10. **What is Docker Swarm, and how does it work?**
   - **Key Points**: **Docker Swarm** is Docker’s native clustering and orchestration tool, which allows you to manage a cluster of Docker hosts as a single virtual system. It provides high availability, load balancing, and scaling for your containers across multiple nodes.

   Key components:
   - **Manager nodes**: Control the swarm and dispatch tasks to worker nodes.
   - **Worker nodes**: Run the containers and execute the tasks.

   Example to initialize a Swarm:
   ```bash
   docker swarm init
   ```

   To deploy a stack:
   ```bash
   docker stack deploy -c docker-compose.yml mystack
   ```

---

These questions test a broad range of your knowledge in Docker, including foundational concepts like containerization and images, as well as more advanced topics such as Docker Swarm, Compose, and networking. With **3 years of experience**, you should be able to explain both basic and advanced Docker usage, troubleshooting techniques, and best practices in containerized environments.

---

Here are the **top 10 Kubernetes interview questions** commonly asked for candidates with **3 years of experience**:

### 1. **What is Kubernetes, and what are its key components?**
   - **Key Points**: Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications. Key components include:
     - **Master Node**: Controls and manages the Kubernetes cluster.
     - **Worker Nodes**: Run the containerized applications.
     - **Pod**: The smallest and simplest Kubernetes object, a group of one or more containers that are tightly coupled.
     - **Kubelet**: An agent that runs on each worker node and ensures containers are running in pods.
     - **Kubectl**: Command-line tool to interact with the Kubernetes API server.

### 2. **What are Pods in Kubernetes?**
   - **Key Points**: A **Pod** is the smallest deployable unit in Kubernetes, representing a single instance of a running process in the cluster. Pods can contain one or more containers, and the containers in a pod share the same network namespace (IP address and port space), storage, and configurations. Pods are ephemeral and can be managed by controllers like Deployments or StatefulSets.

### 3. **Explain the difference between a Deployment and a StatefulSet in Kubernetes.**
   - **Key Points**:
     - **Deployment**: Used for stateless applications. It ensures that a specified number of identical pods are running at any time. Deployments are often used for scalable web applications or microservices.
     - **StatefulSet**: Used for managing stateful applications where each pod must have a unique identity and persistent storage. StatefulSets ensure that each pod gets a stable hostname and persistent volume (PVC) that it can maintain over restarts.

### 4. **What are Kubernetes Services, and what types are there?**
   - **Key Points**: A **Service** in Kubernetes is an abstraction that defines a logical set of pods and a policy to access them. It provides a stable endpoint (IP and DNS) for accessing the pods. Types of services include:
     - **ClusterIP**: Exposes the service on a cluster-internal IP (default).
     - **NodePort**: Exposes the service on a specific port on each node’s IP.
     - **LoadBalancer**: Exposes the service via an external load balancer (usually supported by cloud providers).
     - **ExternalName**: Maps the service to an external DNS name.

### 5. **What is a ConfigMap and a Secret in Kubernetes, and how are they different?**
   - **Key Points**:
     - **ConfigMap**: A Kubernetes resource used to store non-sensitive configuration data as key-value pairs. It is used for managing configuration in a decoupled way.
     - **Secret**: Similar to ConfigMap, but used for storing sensitive data such as passwords, tokens, or keys. Kubernetes stores secrets in a more secure manner (base64 encoding) and can mount them into pods.

### 6. **What are namespaces in Kubernetes, and why are they useful?**
   - **Key Points**: **Namespaces** are virtual clusters within a Kubernetes cluster. They allow for the isolation of resources, such as pods, services, and deployments, across different environments (e.g., development, staging, and production). Namespaces help manage resources in multi-tenant clusters and enable resource quotas and access controls.

### 7. **What is a Kubernetes Ingress?**
   - **Key Points**: **Ingress** is a collection of rules that allow external HTTP and HTTPS traffic to reach the services within a Kubernetes cluster. It provides features like load balancing, SSL termination, and routing based on hostnames or URLs. An Ingress controller is required to implement these rules.

### 8. **How does Kubernetes handle scaling of applications?**
   - **Key Points**: Kubernetes provides several ways to scale applications:
     - **Horizontal Pod Autoscaling (HPA)**: Automatically scales the number of pods in a deployment based on metrics like CPU or memory usage.
     - **Manual Scaling**: You can manually adjust the number of replicas in a Deployment or StatefulSet by running `kubectl scale`.
     - **Cluster Autoscaler**: Automatically adjusts the number of nodes in a cluster based on resource demand.

### 9. **What are persistent volumes (PVs) and persistent volume claims (PVCs) in Kubernetes?**
   - **Key Points**:
     - **Persistent Volumes (PVs)** are storage resources in Kubernetes that provide durable storage beyond the lifecycle of a pod. PVs are created by an administrator and can be provisioned dynamically or statically.
     - **Persistent Volume Claims (PVCs)** are requests for storage by a user or application. A PVC specifies the size and access mode for storage. Kubernetes will bind the PVC to an available PV that matches the requirements.

### 10. **What is a Kubernetes ReplicaSet?**
   - **Key Points**: A **ReplicaSet** is a Kubernetes controller that ensures a specified number of pod replicas are running at any given time. It can automatically replace pods that are deleted or failed. ReplicaSets are often used in conjunction with Deployments to manage pod scaling and ensure application availability.

---

These questions test your understanding of the key concepts and components of Kubernetes, which are essential for managing containerized applications at scale. With **3 years of experience**, you should be able to explain both fundamental concepts (such as Pods, Services, and Deployments) and more advanced topics (like scaling, persistent storage, and Ingress). Be prepared to provide examples and use cases to demonstrate your experience.
---
Here are the **top 10 Git interview questions** commonly asked for candidates with **3 years of experience**:

### 1. **What is Git, and what is the difference between Git and other version control systems?**
   - **Key Points**: Git is a distributed version control system that helps manage changes to source code during software development. Unlike centralized version control systems (CVCS), where there is a central server, Git allows every developer to have a local copy of the repository, providing full access to history and enabling work offline.

### 2. **What is the difference between `git pull` and `git fetch`?**
   - **Key Points**:
     - `git fetch`: Downloads objects and refs from another repository but does not merge them with the current branch. It allows you to see changes in the remote repository before merging.
     - `git pull`: A combination of `git fetch` followed by `git merge` or `git rebase`, depending on configuration. It downloads changes and directly integrates them into your current branch.

### 3. **Explain the difference between `git merge` and `git rebase`.**
   - **Key Points**:
     - **git merge**: Combines the changes from one branch into another, creating a new commit in the process. It preserves the commit history and is often used when integrating feature branches.
     - **git rebase**: Reapplies commits from one branch onto another, essentially rewriting the commit history. It results in a cleaner, linear history, but should be used with caution, especially with shared branches.

### 4. **What is a Git branch, and how do you create and switch between branches?**
   - **Key Points**: A **Git branch** is a separate line of development that allows you to work on features, bug fixes, or experiments without affecting the main codebase. You can create a branch using:
     ```bash
     git branch <branch_name>
     ```
     To switch between branches, you can use:
     ```bash
     git checkout <branch_name>
     ```
     Or with newer versions of Git:
     ```bash
     git switch <branch_name>
     ```

### 5. **What is a Git commit, and what is the importance of writing good commit messages?**
   - **Key Points**: A **Git commit** is a snapshot of changes made to files in a repository. It records the state of the project at a specific point in time. Good commit messages are crucial for understanding the purpose of changes, making collaboration easier, and maintaining a clear project history.

   Example of a good commit message:
   ```
   Fix: Corrected issue with user authentication
   ```
   - A clear structure like:
     - **Type**: (e.g., Fix, Feature, Refactor, Docs)
     - **Scope**: (Optional) Briefly mention the area of code affected
     - **Description**: Concisely explain the change

### 6. **What is a Git remote, and how do you manage it?**
   - **Key Points**: A **Git remote** is a reference to a remote repository (usually hosted on platforms like GitHub or GitLab). You can manage remotes using the following commands:
     - `git remote add <name> <url>`: Adds a new remote repository.
     - `git remote -v`: Lists the current remotes.
     - `git push <remote> <branch>`: Pushes changes to a remote repository.
     - `git pull <remote> <branch>`: Fetches and merges changes from a remote repository.
     - `git remote remove <name>`: Removes a remote reference.

### 7. **What is a Git tag, and how do you create and manage tags?**
   - **Key Points**: A **Git tag** is a reference to a specific commit, typically used to mark important points in the history of a project (e.g., release versions). Tags can be:
     - **Lightweight**: A simple pointer to a commit.
     - **Annotated**: Contains additional information like the tagger’s name, date, and message.

   To create a tag:
   ```bash
   git tag <tag_name>
   ```
   To push a tag to a remote:
   ```bash
   git push origin <tag_name>
   ```

### 8. **How do you resolve merge conflicts in Git?**
   - **Key Points**: A **merge conflict** occurs when two branches have changes in the same part of a file, and Git cannot automatically merge them. To resolve a conflict:
     1. Git will mark the conflicted files, and you’ll need to manually resolve the conflicts by editing the files.
     2. After resolving the conflict, use:
        ```bash
        git add <resolved_file>
        ```
     3. Then, commit the merge:
        ```bash
        git commit
        ```

   Use Git’s conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`) to identify and fix the conflicting changes.

### 9. **What are Git stash and its use cases?**
   - **Key Points**: **Git stash** temporarily saves changes in the working directory that are not ready to be committed. This allows you to switch branches without committing incomplete work.
     - To stash changes: 
       ```bash
       git stash
       ```
     - To apply the most recent stash:
       ```bash
       git stash apply
       ```
     - To list all stashes:
       ```bash
       git stash list
       ```
     - To drop a stash:
       ```bash
       git stash drop
       ```

### 10. **How do you view the commit history in Git?**
   - **Key Points**: You can view the commit history using:
     - `git log`: Displays the commit history in the current branch, showing commit hashes, authors, dates, and commit messages.
     - `git log --oneline`: A condensed view, showing one line per commit.
     - `git log --graph`: Visualizes the commit history as a graph, which is helpful for understanding branch merges.
     - `git diff`: Shows the differences between commits, branches, or the working directory and the index.

---

These questions cover a broad range of Git concepts and practices, from basic commands like `git commit` and `git branch` to more advanced topics like merge conflicts, stashing, and tagging. With **3 years of experience**, you should be comfortable with Git workflows, collaboration practices, and resolving issues that arise during development. Be prepared to demonstrate real-world use cases and problem-solving when answering these questions.

---
Here are the **top 10 Shell scripting interview questions** commonly asked for candidates with **3 years of experience**:

### 1. **What is a shell script, and what are its uses?**
   - **Key Points**: A **shell script** is a text file containing a series of commands that are executed by the shell (e.g., Bash, Zsh). It automates tasks such as file manipulation, program execution, and system monitoring. Shell scripts are used to automate repetitive tasks, manage system configurations, and perform batch processing.

### 2. **What is the difference between `=` and `==` in shell scripting?**
   - **Key Points**:
     - `=`: Used for assigning values to variables or comparing strings in shell scripting. Example: `var=value`.
     - `==`: Used for string comparison inside conditional expressions like `if`. It checks if two strings are equal.
     - In `[[ expression ]]`, `==` is used for string comparison, whereas `=` is more common in `test` commands.

     Example:
     ```bash
     if [ "$var" = "value" ]; then
       echo "Equal"
     fi
     ```

### 3. **Explain the difference between `$?`, `$0`, and `$#` in shell scripting.**
   - **Key Points**:
     - `$?`: The exit status of the last executed command. `0` typically indicates success, and non-zero indicates failure.
     - `$0`: The name of the shell script or program being executed.
     - `$#`: The number of positional parameters (arguments) passed to the script.

     Example:
     ```bash
     echo "Exit status: $?"
     echo "Script name: $0"
     echo "Number of arguments: $#"
     ```

### 4. **What are the different types of loops in shell scripting?**
   - **Key Points**: In shell scripting, you can use different types of loops to iterate over data:
     - **For loop**: Iterates over a list of items or a range of numbers.
       ```bash
       for i in {1..5}; do
         echo $i
       done
       ```
     - **While loop**: Executes as long as a condition is true.
       ```bash
       while [ $count -lt 5 ]; do
         echo $count
         ((count++))
       done
       ```
     - **Until loop**: Executes until a condition becomes true.
       ```bash
       until [ $count -ge 5 ]; do
         echo $count
         ((count++))
       done
       ```

### 5. **What are the difference between `>` and `>>` in shell scripting?**
   - **Key Points**:
     - `>`: Redirects output to a file, overwriting the file if it exists.
     - `>>`: Appends output to a file, preserving its existing content.
     
     Example:
     ```bash
     echo "Hello" > file.txt  # Overwrites the file
     echo "World" >> file.txt # Appends to the file
     ```

### 6. **How do you handle errors in shell scripting?**
   - **Key Points**: Errors can be handled using the following methods:
     - **Exit status check**: You can check the exit status of commands using `$?`.
       ```bash
       some_command
       if [ $? -ne 0 ]; then
         echo "Error occurred"
         exit 1
       fi
       ```
     - **set -e**: This causes the script to exit as soon as a command returns a non-zero exit status.
       ```bash
       set -e
       ```

### 7. **What is the difference between `test` and `[[ ]]` in shell scripting?**
   - **Key Points**:
     - `test` is a command used to evaluate expressions (for example, comparing numbers or strings), and it is POSIX compliant.
     - `[[ ... ]]` is a more advanced conditional expression supported in Bash and other modern shells. It allows for more complex conditions and is less error-prone.

     Example:
     ```bash
     # Using test
     if test $a -eq $b; then
       echo "Equal"
     fi

     # Using [[ ... ]]
     if [[ $a -eq $b ]]; then
       echo "Equal"
     fi
     ```

### 8. **How do you pass arguments to a shell script?**
   - **Key Points**: Arguments can be passed to a shell script when it is executed from the command line. You access them using `$1`, `$2`, etc., for the first, second, etc., argument, and `$@` or `$*` for all arguments.
   
     Example:
     ```bash
     # script.sh
     echo "First argument: $1"
     echo "All arguments: $@"
     ```

     To run the script:
     ```bash
     ./script.sh arg1 arg2 arg3
     ```

### 9. **What are environment variables, and how do you set them in shell scripts?**
   - **Key Points**: **Environment variables** are variables that can be accessed by any process running in the shell. They are often used to store configuration settings and information about the system environment.
     - Set an environment variable:
       ```bash
       export VAR=value
       ```
     - To access an environment variable:
       ```bash
       echo $VAR
       ```

     Example:
     ```bash
     export PATH=$PATH:/new/directory
     ```

### 10. **How do you create and source a shell script?**
   - **Key Points**:
     - **Create**: You can create a shell script by creating a new file with a `.sh` extension and writing your shell commands in it. Make sure to provide execution permissions using `chmod`.
       ```bash
       nano script.sh
       chmod +x script.sh
       ./script.sh
       ```
     - **Source**: The `source` command (or `.`) runs the script in the current shell session, instead of creating a new subprocess. This is useful for updating environment variables or functions defined in the script.
       ```bash
       source script.sh
       ```

---

These questions cover a range of foundational and practical concepts in shell scripting, including variable handling, loops, conditionals, error handling, and file redirection. With **3 years of experience**, you should be comfortable writing scripts to automate tasks, manage system configurations, and solve real-world problems using shell commands and scripting techniques. Be ready to show examples and walk through your thought process when discussing these concepts.