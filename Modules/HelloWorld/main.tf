resource "aws_iam_role" "lambda_exec_role" {
	path   = format("%s", var.parent_context)
	name   = format("%s-role", var.module_name)
	assume_role_policy = file(format("%s/lambdaexec_role-policy.json", var.roles_dir))
}

data "archive_file"  "archivefile" {
	type = "zip"
	source_file = format("%s/%s.py", var.functions_dir, var.module_name)
	output_path = format("%s/%s.zip", var.package_dir, var.module_name)
}

resource "aws_lambda_function" "deploy_lambda" {
	filename = data.archive_file.archivefile.output_path
	function_name = format("%s-lambda", var.module_name)
	role = aws_iam_role.lambda_exec_role.arn
	
	handler = format("%s.lambda_handler", var.module_name)
	runtime = format("%s", var.python_runtime)
}

resource "aws_lambda_invocation" "invoke_lambda_function" {
  function_name = aws_lambda_function.deploy_lambda.function_name

  input = jsonencode({
	"first_name" : "Ram",
	"last_name"  : "Munjuluri"
	})
}