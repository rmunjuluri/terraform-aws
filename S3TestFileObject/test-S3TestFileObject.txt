import json
import boto3

s3 = boto3.resource('s3')

def lambda_handler(event, context):

    bucketlist = []
    for bucket in s3.buckets.all():
        bucketlist.append(bucket.name)
        print("Bucket Name: ", bucket.name)

    return {
        'statusCode': 200,
        'body': ("Response from :", context.function_name, " = ", bucketlist)
    }