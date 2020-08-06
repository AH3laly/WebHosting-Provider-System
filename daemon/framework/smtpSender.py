#!/usr/bin/python2
# Author: Abdelrahman Helaly
# Contact: < AH3laly@gmail.com , https://Github.com/AH3laly >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

import smtplib
import socket
from email.mime.text import MIMEText

import framework as F

class smtpSender:
    """ SEMTP Sender Class """

    def __init__(self):
        socket.setdefaulttimeout(60)
        #self.smtpObj = smtplib.SMTP()
	self.smtpObj = smtplib.SMTP_SSL()


    def connect(self):
        try:
            self.smtpObj.connect(F.config.get("smtpHost"),F.config.get("smtpPort"))
        except Exception, err:
            F.log('We have an error IN smtplib.connect '+err.message,'Error',True)
            return False
    
    """
        try:
            self.smtpObj.login(F.config.get("smtpUser"),F.config.get("smtpPassword"))
            return True
        except Exception, err:
            F.log('We have an error in SMTP.Login '+err.message,'Error',True)
            return False
    """

    def disconnect(self):
        self.smtpObj.close()

    def check(self):
        try:
            self.smtpObj.noop()
        except smtplib.SMTPServerDisconnected:
            return 'disconnected'
        else:
            return 'unknownError'

    def sendEmail(self,params):

        if(not self.smtpObj):
            self.connect()

        if(not self.smtpObj):
            return False

        try:
            msg = MIMEText(params["content"], _charset="UTF-8")
            msg["Subject"] = params["subject"]
            msg["From"] = "WebHosting Daemon <"+params["fromEmail"]+">"
            msg["To"] = params["toEmail"]
	    toEmails = params["toEmail"].split(",")
            self.smtpObj.sendmail(params["fromEmail"], toEmails, msg.as_string())
            return True
        except Exception, err:
            F.log('We have an error in smtp.sendmail '+err.message,'Error',True)
            return False
