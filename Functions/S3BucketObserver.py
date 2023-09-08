import json
import urllib.parse
import boto3

def lambda_handler(event, context):
    # TODO implement
    eventName = event['Records'][0]['eventName']
    bucket = event['Records'][0]['s3']['bucket']['name']
    fileName = event['Records'][0]['s3']['object']['key']
    key = urllib.parse.unquote_plus(event['Records'][0]['s3']['object']['key'], encoding='utf-8')
    print("EventName : ", eventName, " Filename ", fileName, " into/from bucket ", bucket)
    
    return {
        'statusCode': 200,
        'body': json.dumps('EventName : ' + eventName + " Key : " + key)
    }