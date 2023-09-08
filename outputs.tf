output "helloworld_results" {
	description = "This is the result from HelloWorld"
	value = module.HelloWorld.result_entry
}

output "cwlogging_results" {
	description = "This is the result from HelloWorld"
	value = module.CWLogging.result_entry
}

output "accesss3buckets_results" {
	description = "This is the result from HelloWorld"
	value = module.AccessS3Buckets.result_entry
}

output "addition_results" {
	description = "This is the result from Addition"
	value = module.Addition.result_entry
}

output "subtraction_results" {
	description = "This is the result from Subtraction"
	value = module.Subtraction.result_entry
}

output "multiplication_results" {
	description = "This is the result from Multiplication"
	value = module.Multiplication.result_entry
}

output "division_results" {
	description = "This is the result from Division"
	value = module.Division.result_entry
}
