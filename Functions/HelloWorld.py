def lambda_handler(event, context):

    message = 'Hello {} {}!'.format(event['first_name'], event['last_name'])  
    return {
        'statusCode': 200,
        'body' : message
    }