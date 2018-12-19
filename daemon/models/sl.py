#!/usr/bin/python2
# Author: Abdelrahman Mohamed
# Contact: < Abdo.Tasks@Gmail.Com , https://Github.com/abd0m0hamed >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

import SoftLayer
import framework as F
from framework import config


def terminateVirtual(serverId):
    configOptions = F.config.get('sl')

    try:
        client = SoftLayer.create_client_from_env(configOptions['username'],configOptions['password'])
        resp = client.call('Virtual_Guest', 'deleteObject',id=serverId)
        F.log('Virtual Server Terminated > ' + str(resp))

    except Exception, err:
        F.log('Virtual Server Termination Failed > ' + err.message,'Error')

def terminateHardware(serverId):
    configOptions = config.config('sl')

    try:
        client = SoftLayer.create_client_from_env(configOptions['username'],configOptions['password'])
        resp = client.call('Hardware_Server', 'deleteObject',id=serverId)
        F.log('Hardware Server Terminated > '+str(resp))

    except Exception, err:
        F.log('Hardware Server %s Termination Failed > ' % serverId + err.message,'Error')


def cancelCpanelLicense(billingItemId):
    configOptions = config.config('sl')

    try:
        client = SoftLayer.create_client_from_env(configOptions['username'],configOptions['password'])
        resp = client.call('Billing_Item', 'cancelItem',id=billingItemId)
        F.log('cPanel License Terminated > '+str(resp))

    except Exception, err:
        F.log('Cpanel License %s Termination Failed > ' % billingItemId + err.message,'Error')


