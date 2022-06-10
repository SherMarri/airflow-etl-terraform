# Terraform Setup

## Install

Follow the instructions in this [User Manual](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started) and run the commands according to your local operating system.

## Set Variables

Sensitive variables should not be exposed in files. We use [variables.tf](variables.tf) to define the variables and redentials for the infrastructure resources. Although there are some default values assigned, it is strongly recommended to set your own values using the following methods:

- Open [terraform.tfvars](terraform.tfvars) and set your own values for each variable.
- You can also set the values by exporting environment variables with their names prefixed with `TF_VAR_`. For example, the variables `access_key` can be set as `export TF_VAR_access_key=DummyAccessKey`.

## Init & Apply

```
# Install providers
cd terraform
terraform init

# Examine changes
terraform plan

# Apply the terraform script
terraform apply
```
