#!/usr/bin/python2
# Author: Abdelrahman Mohamed
# Contact: < Abdo.Tasks@Gmail.Com , https://Github.com/abd0m0hamed >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

import urllib, urllib2
import framework as F
from framework import config
import base64,httplib

def makecall(args):
    configOptions = config.get('whm')
    headers =  {
    "Authorization":"Basic " + base64.b64encode(configOptions['user'] + ":" + configOptions['pass']),
    "content-Type" : "text/json"
    }
    params = { 'api.version' :  1, 'user':args }
    F.log(configOptions['url']+ " : " + configOptions['user'] + ":" + configOptions['pass'])
    try:
        qs = urllib.urlencode(params)
        req = urllib2.Request(configOptions['url'], qs, headers)
    F.log('Call Response Is: 1')
        f = urllib2.urlopen(req)
    F.log('Call Response Is: 2')
        callResponse = f.read()
        F.log('Call Response Is: 3')
        return callResponse
    except Exception as err:
        F.log('Error Occurred')

def accountSuspend(userName):
    F.log('Terminating User '+userName)
    makecall(userName)

