def lambda_handler(event, context):

    message = int(event['a']) + int(event['b'])  
    print("Sum is : ", message)
    return { 
        'Sum' : message
    }