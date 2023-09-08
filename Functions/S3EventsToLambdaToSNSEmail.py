import json
import urllib.parse
import boto3

client = boto3.client('sns')

def lambda_handler(event, context):
    # TODO implement
    eventName = event['Records'][0]['eventName']
    bucket = event['Records'][0]['s3']['bucket']['name']
    fileName = event['Records'][0]['s3']['object']['key']
    key = urllib.parse.unquote_plus(event['Records'][0]['s3']['object']['key'], encoding='utf-8')
    print("EventName : ", eventName, "Loading ", fileName, " into bucket ", bucket)
    
    emailMessage = "EventName : " + eventName + " Loading " + fileName + " into bucket " + bucket
    response = client.publish(TopicArn='arn:aws:sns:us-east-1:439306379615:lambdaToEmail_topic',
        Subject="Message via S3-to-Lambda-to-SNSTopic-->Email",
        Message=emailMessage)
    print("Message published : ", emailMessage)
    
    return {
        'statusCode': 200,
        'body': json.dumps('EventName : ' + eventName + " Key : " + key)
    }