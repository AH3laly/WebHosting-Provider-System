#!/usr/bin/python2
# Author: Abdelrahman Mohamed
# Contact: < Abdo.Tasks@Gmail.Com , https://Github.com/abd0m0hamed >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

import urllib, urllib2, ssl
import framework as F

class urlCaller:

    def makecall(self,url,params = {},headers = {}):
        qs = urllib.urlencode(params)
        req = urllib2.Request(url, qs, headers)
        try:
            f = urllib2.urlopen(req,context=ssl._create_unverified_context())
            return f.read()
        except Exception, err:
            F.log("Error Occurred While Calling URL %s" % err.message,'Error')
            return False
