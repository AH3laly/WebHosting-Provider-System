#!/usr/bin/python2
# Author: Abdelrahman Helaly
# Contact: < AH3laly@gmail.com , https://Github.com/AH3laly >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.


def get(key = 'all'):

    conf = {
        #Database Configuration
        'db':{
            'user':'root',
            'password':'DatabaseVeyStrongAndComplexDatabase',
            'host':'localhost',
            'database':'DatabaseName',
            'raise_on_warnings': True
        },
        #Url frequently called to trigger cart processing,
        #So. When a new order created, It will be processed when this URL called
        'url':{
            'processCart':'https://dmz.domain.com/cron/processCart'
        },
        #SMTP Configuration
        'adminEmail':'info@domain.com',
        'smtpHost':'smtp.domain.com',
        'smtpPort':587,
        'smtpFrom':'noreply@domain.com',
        'smtpUser':'noreply@domain.com',
        'smtpPassword':'noreplyAccountPassword',
        #Enom provider configuration
        'enom':{
            'url':'https://reseller.enom.com/interface.asp',
            'uid':'enomResellerUsername',
            'pw':'TheEnomAccountComplexPassword'
        },
        #Softlayer API username (Used to perform actions on Softlayer account)
        'sl':{
            'username':'SoftlayerAcccount',
            'password':'SoftlayerAccountVeryLognAndComplexPassword'
        },
        #WHM API login information
        'whm':{
            'url':'https://srv45787.domain.com:2087/json-api/',
            'user':'root',
            'token':'WhmToken',
            'version':'1'
        },
        #2Checkout API information
        'tco':{
            'publicKey':'41axd8e-5847-3a8w-954a-6DE858F0195Z',
            'privateKey':'5s4r85t3-54d9-q2a6-9qdc-41d5d4f7d4d',
            'sellerId':'548454874',
            'adminUser':'',
            'adminPassword':'',
            'sandBox':True
        }
    }
    
    if key == 'all':
        return conf
    else:
        return conf[key]
