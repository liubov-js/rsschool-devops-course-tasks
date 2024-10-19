# rsschool-devops-course-tasks

## Task 2: Basic Infrastructure Configuration

Terraform code to configure the basic networking infrastructure required for a Kubernetes (K8s) cluster.

![Task Schema](./public/schema.png)

1. Created Terraform code to configure the following:

- VPC (virtual private cloud) in us-east-1 zone
- 2 public subnets in different AZs
- 2 private subnets in different AZs
- Internet Gateway
- Routing configuration:
  - Instances in all subnets can reach each other
  - Instances in public subnets can reach addresses outside VPC and vice-versa
    ![Resource map](./public/routes.png)
- Security Groups and Network ACLs for the VPC and subnets
- NAT for private subnets, so instances in private subnet can connect with outside world. In the task, creating one NAT Gateway for practice is enough, but in production, we should create NAT for every subnet.
  ![Resource map](./public/terminal.png)

2. Set up a GitHub Actions (GHA) pipeline for the Terraform code.

## Task 3: K8s Cluster Configuration and Creation

Configuration and deployment a Kubernetes (K8s) cluster on AWS using k3s. Verifying the cluster by running a simple workload.

1. Choose Deployment Method: kOps or k3s.

- kOps handles the creation of most resources for you, while k3s requires you to manage the underlying infrastructure.
- kOps may lead to additional expenses due to the creation of more AWS resources.
- kOps requires a domain name or sub-domain.
- Use AWS EC2 instances from the Free Tier to avoid additional expenses.

2. Extend Terraform Code: added a bastion host.

3. Deploy the Cluster

- Deploy the K8s cluster using the chosen method (kOps or k3s).
- Ensure the cluster is accessible from your local computer.

4. Verify the Cluster

- Run the kubectl get nodes command from your local computer to get information about the cluster.
- Provide a screenshot of the kubectl get nodes command output.

5. Deploy a Simple Workload

- Deploy a simple workload on the cluster using the following command:
  `kubectl apply -f https://k8s.io/examples/pods/simple-pod.yaml`
- Ensure the workload runs successfully on the cluster.

6. Additional Task: Document the cluster setup and deployment process in a README file.
