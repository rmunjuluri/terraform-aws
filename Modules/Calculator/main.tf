resource "aws_apigatewayv2_api" "CalculatorApi" {
	name = format("%s-http-api", var.module_name)
	description = "This is the CalculatorApi"
	protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "CalculatorApiIntegration" {
	api_id 				= aws_apigatewayv2_api.CalculatorApi.id
	integration_type	= "AWS_PROXY"
	
	connection_type		= "INTERNET"
	content_handling_strategy	= "CONVERT_TO_TEXT"
	description	= "Lambda"
	integration_method = "POST"
	integration_uri	= aws_lambda_function.deploy_lambda.invoke_arn
	passthrough_behavior	= "WHEN_NO_MATCH"
}