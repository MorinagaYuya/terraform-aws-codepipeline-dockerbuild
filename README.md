# terraform-aws-codebuild-dockerbuild
Little module for setting up a CI pipeline that triggers with a github webhook and builds a docker image. I use this module with [this module](https://registry.terraform.io/modules/halfdanrump/fargate-scheduled-task-multicontainer/aws/12.6.1) for running scheduled tasks in AWS Fargate.

# Usage

## Getting your Docker image to the right ECR repository
This module does not control the contents of the buildspec file used to build the Docker image, so make sure configure the buildspec file with the right ECR repository. The module creates an ECR repository with the name `"${var.name}_${var.environment}"`. In the case of `name=api` and `environment=production`, the created ECR repo will have the name `api_production`.
