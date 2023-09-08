def lambda_handler(event, context):

    message = int(event['a']) - int(event['b'])
    print("Difference is : ", message)
    return { 
        'difference' : message
    }