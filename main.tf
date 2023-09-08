terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

locals {
	parent_context = "/Iac-Terraform/"
}

provider "aws" {
	region  = "us-east-1"
	access_key = var.aws_access_key_id
	secret_key = var.aws_secret_access_key
}

module "HelloWorld" {
  source = "./Modules/HelloWorld"
  parent_context = local.parent_context
  module_name = "HelloWorld"
  
  functions_dir = var.functions_dir
  roles_dir = var.roles_dir
  policies_dir = var.policies_dir
  package_dir = var.package_dir
  python_runtime = var.python_runtime
}

module "CWLogging" {
  source = "./Modules/CWLogging"
  parent_context = local.parent_context
  module_name = "CWLogging"
  
  functions_dir = var.functions_dir
  roles_dir = var.roles_dir
  policies_dir = var.policies_dir
  package_dir = var.package_dir
  python_runtime = var.python_runtime
}


module "AccessS3Buckets" {
  source = "./Modules/AccessS3Buckets"
  parent_context = local.parent_context
  module_name = "AccessS3Buckets"
  
  functions_dir = var.functions_dir
  roles_dir = var.roles_dir
  policies_dir = var.policies_dir
  package_dir = var.package_dir
  python_runtime = var.python_runtime
}

module "S3BucketObserver" {
  source = "./Modules/S3BucketObserver"
  parent_context = local.parent_context
  module_name = "S3BucketObserver"
  
  
  functions_dir = var.functions_dir
  roles_dir = var.roles_dir
  policies_dir = var.policies_dir
  package_dir = var.package_dir
  python_runtime = var.python_runtime
}

module "S3EventsToLambdaToSNSEmail" {
  source = "./Modules/S3EventsToLambdaToSNSEmail"
  parent_context = local.parent_context
  module_name = "S3EventsToLambdaToSNSEmail"
  
  
  functions_dir = var.functions_dir
  roles_dir = var.roles_dir
  policies_dir = var.policies_dir
  package_dir = var.package_dir
  python_runtime = var.python_runtime
}

module "Addition" {
  source = "./Modules/Addition"
  parent_context = local.parent_context
  module_name = "Addition"
  
  functions_dir = var.functions_dir
  roles_dir = var.roles_dir
  policies_dir = var.policies_dir
  package_dir = var.package_dir
  python_runtime = var.python_runtime
}

module "Subtraction" {
  source = "./Modules/Subtraction"
  parent_context = local.parent_context
  module_name = "Subtraction"
  
  functions_dir = var.functions_dir
  roles_dir = var.roles_dir
  policies_dir = var.policies_dir
  package_dir = var.package_dir
  python_runtime = var.python_runtime
}

module "Multiplication" {
  source = "./Modules/Multiplication"
  parent_context = local.parent_context
  module_name = "Multiplication"
  
  functions_dir = var.functions_dir
  roles_dir = var.roles_dir
  policies_dir = var.policies_dir
  package_dir = var.package_dir
  python_runtime = var.python_runtime
}

module "Division" {
  source = "./Modules/Division"
  parent_context = local.parent_context
  module_name = "Division"
  
  functions_dir = var.functions_dir
  roles_dir = var.roles_dir
  policies_dir = var.policies_dir
  package_dir = var.package_dir
  python_runtime = var.python_runtime
}
