#!/usr/bin/python2
# Author: Abdelrahman Mohamed
# Contact: < Abdo.Tasks@Gmail.Com , https://Github.com/abd0m0hamed >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

import time,sys
from models import package,domain
import framework as F


def checkExpiringPackages():
    F.log('Starting checkExpiringPackages ..','Notice',True)
    F.db.connect(F.config.get('db'))
    pck = package.package()
    pck.checkExpiring()
    F.db.disconnect()
    F.log('Finished checkExpiringPackages ..','Notice',True)
    time.sleep(3600)

def checkTransferringDomains():
    F.log('Starting checkTransferringDomains ..','Notice',True)
    F.db.connect(F.config.get('db'))
    dom = domain.domain()
    dom.checkTransferring()
    F.db.disconnect()
    F.log('Finished checkTransferringDomains ..','Notice',True)
    time.sleep(3600)

def startMailer():
    F.log('Starting startMailer ..','Notice',True)
    F.db.connect(F.config.get('db'))
    F.mailer.sendEmails()
    F.db.disconnect()
    F.log('Finished startMailer, Will restart in 30 seconds ..','Notice',True)
    time.sleep(30)

def sendHeartBeat():
    F.log('Starting sendHeartBeat ..','Notice',True)
    F.db.connect(F.config.get('db'))
    F.mailer.pushMessage(F.config.get('adminEmail'),'WebHosting Daemon Hearbeat '+F.getFullDate(),'I am Okay and Fine ' + F.getFullDate())
    F.db.disconnect()
    F.log('Finished sendHeartBeat, Will restart in 4 Hours ..','Notice',True)
    time.sleep(14400)

def cartProcessor():
    F.log('Starting cartProcessor ..','Notice',True)
    F.db.connect(F.config.get('db'))

    url = F.config.get('url')['processCart']

    callResult = F.urlCaller.makecall(url)
    if(callResult != 'Done'):
        F.log('Cart Processing Not Done '+str(callResult),'Error')

    callResult = F.urlCaller.makecall(url)
    if(callResult != 'Done'):
        F.log('Cart Processing Not Done '+str(callResult),'Error')

    callResult = F.urlCaller.makecall(url)
    if(callResult != 'Done'):
        F.log('Cart Processing Not Done '+str(callResult),'Error')

    F.db.disconnect()

    F.log('Finished cartProcessor, Will restart in 30 seconds ..','Notice',True)
    time.sleep(30)



def initialize():

    try:
        module = sys.argv[1]
    except Exception as err:
        exit('Invalid Parameter')


    if(module=='checkExpiringPackages'):

        F.logFile = 'Log_checkExpiringPackages'
        while True:
            try:
                checkExpiringPackages()
            except Exception as err:
                F.log('Error Occurred with Function checkExpiringPackages: '+err.message,'Error')

    elif(module=='checkTransferringDomains'):

        F.logFile = 'Log_checkTransferringDomains'
        while True:
            try:
                checkTransferringDomains()
            except Exception as err:
                F.log('Error Occurred with Function checkTransferringDomains: '+err.message,'Error')

    elif(module=='startMailer'):

        F.logFile = 'Log_startMailer'
        while True:
            try:
                startMailer()
            except Exception as err:
                F.log('Error Occurred with Function startMailer: '+err.message,'Error')

    elif(module=='cartProcessor'):

        F.logFile = 'Log_cartProcessor'
        while True:
            try:
                cartProcessor()
            except Exception as err:
                F.log('Error Occurred with Function cartProcessor: '+err.message,'Error')

    elif(module=='sendHeartBeat'):

        F.logFile = 'Log_sendHeartBeat'
        while True:
            try:
                sendHeartBeat()
            except Exception as err:
                F.log('Error Occurred with Function sendHeartBeat: '+err.message,'Error')

    else:
        exit('Bad Argument')

initialize()
