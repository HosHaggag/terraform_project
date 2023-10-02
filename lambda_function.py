import boto3

def lambda_handler(to_address, subject):
    # Create an SES client
    client = boto3.client('ses')

    # Send the email
    response = client.send_email(
        Source='haggagdev@gmail.com',
        Destination={
            'ToAddresses': [
                'haggagdev@gmail.com',
            ]
        },
        Message={
            'Subject': {
                'Data': 'New Version of Terraform Applyed'
            },
            'Body': {
                'Text': {
                    'Data': 'New Version of Terraform Applyed check out here : https://github.com/HosHaggag/terraform_project.git'
                }
            }
        }
    )
    
    return response