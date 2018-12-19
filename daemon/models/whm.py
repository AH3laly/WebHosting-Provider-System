#!/usr/bin/python2
# Author: Abdelrahman Mohamed
# Contact: < Abdo.Tasks@Gmail.Com , https://Github.com/abd0m0hamed >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

import framework as F
from framework import config
from libs import whmapi

def accountSuspend(userName):
    try:
        callInfo = {};
        callInfo['command'] = 'suspendacct'
        callInfo['user'] = userName
        callResult = whmapi.makecall(callInfo)

    	if(callResult==1):
	    F.log('cPanel Account ' + userName + ' Suspended, Status Message: ' + callResult['statusmsg'],'notice')
    	else:
	    F.log('cPanel Account ' + userName + ' Not Suspended, Error Message: ' + callResult['statusmsg'],'error')
    except Exception as err:
	F.log('Error: ' + err.message,'error')
