#!/usr/bin/python2
# Author: Abdelrahman Helaly
# Contact: < AH3laly@gmail.com , https://Github.com/AH3laly >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.


import urllib, urllib2
import framework as F
from framework import config
import xml.etree.ElementTree

def makecall(params):
    configOptions = config.get('enom')

    headers = {
        #'content-Type:' : 'text/json'
    }

    params['UID'] = configOptions['uid']
    params['PW'] = configOptions['pw']
    params['ResponseType'] = 'XML'

    qs = urllib.urlencode(params)
    req = urllib2.Request(configOptions['url'], qs, headers)


    f = urllib2.urlopen(req)
    xmlResponse = f.read()
    respRoot = xml.etree.ElementTree.fromstring(xmlResponse)
    elements = respRoot.findall('*')

    return parseResponse(elements)


def parseResponse(elements):
    elementsArray = {}
    for el in elements:
        if(el.findall("*")):
            elementsArray[el.tag] = parseResponse(el)
        else:
            elementsArray[el.tag] = el.text
    return elementsArray

def getOrder(orderId):
    params = {
        'Command':'TP_GetOrderDetail',
        'TransferOrderDetailID':orderId
    }
    return makecall(params)
