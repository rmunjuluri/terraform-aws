output "result_entry" {
  value = jsondecode(aws_lambda_invocation.invoke_lambda_function.result)
}