# Java APM to Elasticsearch

## Requirements:

Google Cloud Platform:
- folder ID
- billing ID
- Service Account Key

Local machine:
- git
- terraform
<!-- - gcloud
- kubectl
- helm -->

## Guide

1. Clone this repo:

```sh
git clone ...
```

2. Change dir to terraform folder:

```sh
cd gcp-terraform-exp-java-elastic/terraform
```

3. Rename .example_terraform.tfvars to terraform.tfvars:

```sh
mv .example_terraform.tfvars terraform.tfvars
```

4. Fill the required values in the terraform.tfvars.

> Change the backend in `terraform/backend.tf` to your backend configuration or delete it if you want to use local backend.

5. Initialize Terraform:
```sh
terraform init
```

6. Apply Terraform:
```sh
terraform apply -auto-approve
```