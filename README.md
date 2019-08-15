# terraform-aws-codebuild-dockerbuild
Little module for setting up a CI pipeline that triggers with a github webhook and builds a docker image. I use this module with [this module](https://registry.terraform.io/modules/halfdanrump/fargate-scheduled-task-multicontainer/aws/12.6.1) for running scheduled tasks in AWS Fargate.

# Usage

## Getting your Docker image to the right ECR repository
This module does not control the contents of the buildspec file used to build the Docker image, so make sure configure the buildspec file with the right ECR repository. The module creates an ECR repository with the name `"${var.name}_${var.environment}"`. In the case of `name=api` and `environment=production`, the created ECR repo will have the name `api_production`.

## ECR Image Retention Policy
Untagged images that are older than 14 days are untagged. Every time the CI pipeline build the docker image, the new image will be tagged with `latest`, and the previous image will be untagged and hence removed after 14 days.

## Example

```hcl
variable "github_provider_token" {}
variable "github_webhook_token" {}

locals {
  organization   = "SnapDish"
  region         = "ap-northeast-1"
}

provider "aws" {
  region     = "${local.region}"
  version = "=2.7"
}

provider "github" {
  token        = "${var.github_provider_token}"
  organization = "${local.organization}"
}

module "conterec_production_cicd" {
  source                     = "halfdanrump/codepipeline-dockerbuild/aws"
  version                    = "12.6.3"
  name                       = "my_service"
  account_id                 = "my_account_id"
  environment                = "production"
  github_webhook_token       = "my_github_secret"
  git_repo                   = "my_repo"
  git_branch                 = "master"
  build_image                = "aws/codebuild/docker:18.09.0"
  dockerbuild_timeout        = "15"
  dockerbuild_buildspec_path = "buildspec/buildspec-dockerbuild-production.yml"
  unittest_buildspec_path    = "buildspec/buildspec-unittest-allenvs.yml"
  unittest_security_groups   = ["sg-xxxxxx", "sg-xxxxxx"]
  unittest_subnets           = ["subnet-xxxxxx"]
  unittest_vpc               = "vpc-xxxxxx"
  unittest_image             = "aws/codebuild/python:3.6.5"
  unittest_timeout           = 15
}
```
