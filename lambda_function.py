import os
import boto3
import json
from datetime import datetime

from_email = "haggagdev@gmail.com"
config_set_name = "sen_email"
client = boto3.client('ses')


def lambda_handler(event, context):

    body_html = f"""<html>
        <head></head>
        <body>
          <h2>Email from AWS SES!</h2>
          <br/>
          <p>This was sent from a Python Lambda using boto3</p> 
        </body>
        </html>
                    """

    email_message = {
        'Body': {
            'Html': {
                'Charset': 'utf-8',
                'Data': body_html,
            },
        },
        'Subject': {
            'Charset': 'utf-8',
            'Data': "Hello from AWS SES",
        },
    }

    ses_response = client.send_email(
        Destination={
            'ToAddresses': ['haggagdev@gmail.com'],
        },
        Message=email_message,
        Source=from_email,
        ConfigurationSetName=config_set_name,
    )

    print(f"ses response id received: {response['MessageId']}.")

