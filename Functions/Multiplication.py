def lambda_handler(event, context):

    message = int(event['a']) * int(event['b'])  
    print("Product is : ", message)
    return { 
        'product' : message
    }