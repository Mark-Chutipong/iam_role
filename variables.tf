variable "iam_policy_name" {
  type    = string
  default = ""
}

variable "iam_policy" {
  type    = string
  default = ""
}

variable "iam_role_name" {
  type    = string
  default = ""
}

variable "iam_instance_profile_name" {
  type    = string
  default = ""
}

variable "iam_policy_tags" {
  type    = map(string)
  default = {}
}

variable "iam_role_tags" {
  type    = map(string)
  default = {}
}
