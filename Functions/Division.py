def lambda_handler(event, context):

    message = int(event['a']) / int(event['b'])  
    print("Quotient is : ", message)
    return { 
        'Quotient' : message
    }