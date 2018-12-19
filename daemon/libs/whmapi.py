#!/usr/bin/python2
# Author: Abdelrahman Mohamed
# Contact: < Abdo.Tasks@Gmail.Com , https://Github.com/abd0m0hamed >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.


import urllib, urllib2
from framework import config
import json

def makecall(params):
    
    conf = config.get('whm')
    fullUrl = conf['url'] + params['command'] + '?api.version=' + conf['version']

    headers = {
        #'content-Type:' : 'text/json'
        'Authorization' : 'whm ' + conf['user'] + ':' + conf['token']
    }

    qs = urllib.urlencode(params)
    req = urllib2.Request(fullUrl, qs, headers)

    f = urllib2.urlopen(req)
    responseObj = parseResponse(f.read())
    return responseObj['metadata']['result']

def parseResponse(jsonResponse):
    return json.loads(jsonResponse)


