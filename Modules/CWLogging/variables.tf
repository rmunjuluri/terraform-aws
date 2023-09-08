variable "functions_dir" {}
variable "roles_dir" {}
variable "policies_dir" {}
variable "package_dir" {}
variable "python_runtime" {}

variable "parent_context" {
  description = "The parent context to use as iam.path"
  type        = string
  default     = "place_holder"
}

variable "module_name" {
  description = "The module name to be used"
  type        = string
  default     = "place_holder"
}