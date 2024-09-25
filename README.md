# rsschool-devops-course-tasks

## Task 1: AWS Account Configuration

**In this task, I have done:**

1. Install AWS CLI and Terraform.

2. Create IAM User in my AWS account and Configure MFA for both the new user and the root user. Generate a new pair of Access Key ID and Secret Access Key for the new user.

3. Configure AWS CLI with the new user's credentials.

4. Create a bucket `rs-school-s3` via Terraform for Terraform states (watch `s3.tf` file).

5. Create an IAM role `GithubActionsRole` for Github Actions using Terraform resource (watch `iam_role.tf` file).

6. Configure an Identity Provider and Trust policies for Github Actions.

7. Create a Github Actions workflow for deployment via Terraform. The workflow has 3 jobs that run on pull request and push to the `main` branch:
   - `terraform-check` with format checking
   - `terraform-plan` for planning deployments
   - `terraform-apply` for deploying

**Structure:**

- `main.tf` contains the main set of configuration for the module.
- `variables.tf` contains the variable definitions for the module.
- `s3.tf` and `iam_role.tf` contain resources for creating bucket and role respectively.
