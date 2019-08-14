variable account_id{} # something that looks like 211377887982

variable name {}  # project name

variable environment {}  # name of the environment, e.g. staging or production

variable github_webhook_token {}  #

variable git_repo {} # name of the github repo

variable git_branch {
  default = "production"
  }

variable git_organization {
  default = "SnapDish"
  }

variable build_image {
  default = "aws/codebuild/docker:18.09.0"
}

variable dockerbuild_timeout {
  default = 5
}

variable unittest_image {
  default = "aws/codebuild/python:3.6.5"
}

variable unittest_timeout {
  default = 15
}

variable unittest_vpc {

}

variable unittest_subnets {
  description = "List of subnet ids for the test runner"
  default     = []
}

variable unittest_security_groups {
  description = "List of security group ids for the test runner"
  default     = []
}


variable unittest_buildspec_path {}

variable dockerbuild_buildspec_path {}

locals {
  module_version = "1.0"
}
