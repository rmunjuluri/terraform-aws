variable "functions_dir" {
	description = "This is where we store the lambda python files"
	type		= string
	default		= "./Functions"
}
variable "package_dir" {
	description = "This the folder to stored the packaged functions"
	type		= string
	default		= "./Packages"
}

variable "roles_dir" {
	description = "This is where we store the role definition"
	type		= string
	default		= "./Roles"
}
variable "policies_dir" {
	description = "This is where we store the policy files"
	type		= string
	default		= "./Policies"
}
variable "python_runtime" {
	description = "This is the python runtime version for lambda"
	type = string
	default = "python3.11"
}
