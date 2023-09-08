resource "aws_iam_role" "lambda_exec_role" {
	path   = format("%s", var.parent_context)
	name   = format("%s-role", var.module_name)
	assume_role_policy = file(format("%s/lambdaexec_role-policy.json", var.roles_dir))
}
 
resource "aws_iam_role_policy" "cloudwatch_logging_policy" {
	name         = format("%s-cw-logging-policy", var.module_name)
	policy = file(format("%s/cloudwatch_logging-policy.json", var.policies_dir))
	role = aws_iam_role.lambda_exec_role.name
}

resource "aws_iam_role_policy" "lambda_publish_to_sns" {
	name         = format("%s-sns-topic-publish-policy", var.module_name)
	policy = file(format("%s/access_sns_topic-policy.json", var.policies_dir))
	role = aws_iam_role.lambda_exec_role.name
}

resource "aws_s3_bucket" "s3_bucket" {
	bucket = format("%s-s3", lower(var.module_name))
}

resource "aws_s3_bucket_notification" "allow_s3_notifications" {
	bucket = format("%s-s3", lower(var.module_name))
	
	lambda_function {
		lambda_function_arn = aws_lambda_function.deploy_lambda.arn
		events = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]
		filter_prefix = "test-"
		filter_suffix = ".txt"
	}
}

################ SNS Topic ###################################
resource "aws_sns_topic" "s3_file_uploads" {
  name = format("%s-topic", var.module_name)
}
################ SNS Subscription Resource ###################
resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.s3_file_uploads.arn
  protocol  = "email-json"
  endpoint  = "rmunjuluri@yahoo.com"
}
##############################################################


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

resource "aws_lambda_permission" "s3_observer" {
	statement_id = "S3EventsTrigger"
	action = "lambda:InvokeFunction"
	function_name = aws_lambda_function.deploy_lambda.function_name
	principal = "s3.amazonaws.com"
	source_arn = aws_s3_bucket.s3_bucket.arn
}



