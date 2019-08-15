variable account_id{
  type        = "string"
  description = "Your 12 digit numeric AWS account id"
  }

variable name {
  type        = "string"
  description = "Name of the project. All resources will include the name. "
}

variable environment {
  type        = "string"
  description = "Name of the runtime environment, e.g. `staging` or `production`."
  }

variable github_webhook_token {
  type        = "string"
  description = "A secret github token used to setup the github webhook that will trigger the CI pipeline."
  }  #

variable git_repo {
  type        = "string"
  description = "Name of the github repo."
}

variable git_branch {
  type        = "string"
  description = "The name of the branch that, when pushed to, will trigger the CI pipeline."
  default     = "master"
  }

variable git_organization {
  type        = "string"
  description = "Name of the github organization that the repository belongs to."
  default     = "SnapDish"
  }

variable build_image {
  type        = "string"
  description = "Name of the image that will be used to in the piepline build stage."
  default     = "aws/codebuild/docker:18.09.0"
}

variable dockerbuild_timeout {
  type        = "string"
  description = "Timeout in minutes of the docker build."
  default     = 5
}

variable unittest_image {
  type        = "string"
  description = "Name of the image that will be used to run unit tests."
  default     = "aws/codebuild/python:3.6.5"
}

variable unittest_timeout {
  type        = "string"
  description = "Timeout in minutes of the unit test pipeline stage."
  default     = 15
}

variable unittest_vpc {
  type        = "string"
  description = "id of the vpc in which unit tests are run."
}

variable unittest_subnets {
  type        = list(string)
  description = "List of subnet ids for the test runner"
  default     = []
}

variable unittest_security_groups {
  type        = list(string)
  description = "List of security group ids for the test runner"
  default     = []
}


variable unittest_buildspec_path {
  type        = "string"
  description = "path to the buildspec file used to run the unit tests."
}

variable dockerbuild_buildspec_path {
  type        = "string"
  description = "path to the buildspec file used to build the docker image."
}
