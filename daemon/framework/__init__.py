#!/usr/bin/python2
# Author: Abdelrahman Mohamed
# Contact: < Abdo.Tasks@Gmail.Com , https://Github.com/abd0m0hamed >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

import os,sys
import framework.config as config
import framework.database
import framework.smtpSender
import framework.urlCaller
import datetime
from models import mailer
import framework as F

from datetime import time,date

logFile = 'Default'

def getDate():
    return datetime.datetime.now().isoformat()

def getTime():
    return datetime.datetime.now().time().isoformat()

def getFullDate():
    dateNow = datetime.date.today().isoformat()
    timeNow = datetime.datetime.now().time().isoformat()
    return dateNow+' '+timeNow

def getDateOnly():
    return date.today().isoformat()

def log(message,type='Notice',fsOnly = False):
    logFileName = F.logFile + '_' + F.getDateOnly()
    dateNow = F.getDateOnly()
    timeNow = str(F.getTime())
    cwd = os.path.dirname(sys.argv[0])
    mfile = file(cwd+'/logs/'+logFileName,'a')
    logMsg = '['+type+']: '+ dateNow+' '+timeNow+' : ' + message
    mfile.writelines(logMsg+'\r\n')

    print(logMsg)

    """
    if(fsOnly==False and type.lower()=='error'):
        F.mailer.pushMessage(F.config.get('adminEmail'),'WebHosting Deamon Error','WebHosting Deamon Error Occurred: \r\n%s ' % logMsg)
    """

    mfile.close()

def frontLog(query):
    F.db.execute(""" INSERT INTO frontUpdate (`query`,`isProcessed`,`isSuccess`,`creationDate`) VALUES (%s,%s,%s,%s) """ , (query,0,0,F.getFullDate()))
    F.db.commit()


db = database.database()

mailer = mailer.mailer()
urlCaller = urlCaller.urlCaller()

