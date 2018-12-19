#!/usr/bin/python2
# Author: Abdelrahman Mohamed
# Contact: < Abdo.Tasks@Gmail.Com , https://Github.com/abd0m0hamed >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.


import framework as F
import time
from framework import smtpSender

class mailer:

    def __init__(self):
        self.mailerObj = smtpSender.smtpSender()

    def pushMessage(self,to,subject,message):

        fullDate = F.getFullDate()
        q = """
            INSERT INTO `email` (`from`,`to`, `subject`,`content`,`isSent`,`isDead`,`isRetry`,`creationDate`)
            VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
            """

        F.db.execute(q,(F.config.get('smtpFrom'),to,subject,message,0,0,0,fullDate))
        F.db.commit()

        return True

    def sendEmails(self):
        
    result = F.db.execute("SELECT id, `from` AS fromEmail,`to` AS toEmail,subject ,content FROM email WHERE isSent = 0 ORDER BY `id` ASC LIMIT 30").fetchall()

        if(len(result)==0):
            return False

        if(self.mailerObj.connect() == False):
            return False

        for (id, fromEmail, toEmail ,subject ,content) in result:
            try :
                sentResult = self.mailerObj.sendEmail({'fromEmail':F.config.get('smtpFrom'),'toEmail':toEmail,'subject':subject,'content':content})
            except Exception, err:
                F.log(err.message,'Error')
                return False

            if(sentResult==True):
                F.log("Message "+str(id)+" Sent To : "+toEmail)
                qResult = F.db.execute(""" UPDATE email SET isSent = %s WHERE id = %s """,(1,id))
                F.db.commit()
            else:
        qResult = False
                F.log("Error sending Message.",'Error')
                if(self.mailerObj.check()=='disconnected'):
                    self.mailerObj.connect()


            if(qResult):
                F.db.commit()
            else:
                F.log('Error Updating Message '+str(id)+' Status','Error',True)

            time.sleep(5)

        self.mailerObj.disconnect()
