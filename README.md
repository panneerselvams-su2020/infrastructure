# Infrastructure As Code

## Overview

GitLab Provisioner uses [terraform][tfhome] to create a cluster of virtual
machines on [Google Cloud][tfgoogle]. The [terraform][tfhome] job expects
variables set as environment variables or in a `terraform.tfvars` file.

*NOTE*: [Terraform][tfhome] must be version 0.12 or greater.

## How Terraform Stores Current State

[Terraform][tfhome] stores cluster state data in
`.terraform/terraform.tfstate` by default. Configuring the `prefix` and
`bucket` variables will enable storage in a remote bucket instead and is
useful for sharing state among multiple administrators. The following
resources provide some useful background information.

## Creating AWS Networking Setup using terraform

Pre-Requisites:-

Install terraform
run terraform init in the folder where main.tf is present

Run the following commands 

## Using workspace
Each Terraform configuration has an associated backend that defines how operations are executed and where persistent data such as the Terraform state are stored.

The persistent data stored in the backend belongs to a workspace. Initially the backend has only one workspace, called "default", and thus there is only one Terraform state associated with that configuration.

Certain backends support multiple named workspaces, allowing multiple states to be associated with a single configuration. The configuration still has only one backend, but multiple distinct instances of that configuration to be deployed without configuring a new backend or changing authentication credentials.

## Commands
terraform workspace new workpace name

terraform plan
terraform apply with parameters
terraform destroy

terraform workspace delete name
terraform workspace select name -- to switch







