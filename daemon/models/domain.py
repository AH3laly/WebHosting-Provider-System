#!/usr/bin/python2
# Author: Abdelrahman Helaly
# Contact: < AH3laly@gmail.com , https://Github.com/AH3laly >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.


import time,re
import framework as F
from datetime import date,datetime
from framework import database
from models import enom

class domain:

    def checkTransferring(self):

        today = date.today()

        q = """ SELECT id, orderDetailsId, sld, tld, statusCode, statusDescription
            FROM domainTransferShadow
            WHERE isDead = 0
            """
        domains = F.db.execute(q).fetchall()

        for (id,orderDetailsId,sld,tld,statusCode,statusDescription) in domains:
            orderInfo = enom.getOrder(orderDetailsId)
            if(orderInfo['ErrCount']!='0'):
                for erK,erV in orderInfo['errors'].iteritems():
                    F.log('Error Calling Enom API, Item Local ID: %s, Enom ID: %s, SLD: %s, TLD: %s , Error: %s' % (id,orderDetailsId,sld,tld,erV),'Error')
            else:
                if(orderInfo['transferorderdetail']['statusid'] != statusCode):

                    if(orderInfo['transferorderdetail']['statusid']==5):
                        isDead = 1
                    else:
                        isDead = 0
                    
                    pattern = re.compile('enom',re.IGNORECASE)
                    statusdesc = pattern.sub('WebHosting',orderInfo['transferorderdetail']['statusdesc'])

		    frontQuery = """ UPDATE domainTransferShadow SET statusCode = '%s', statusDescription = '%s', isDead='%s' WHERE orderDetailsId = '%s' """ % (orderInfo['transferorderdetail']['statusid'],statusdesc,isDead,orderDetailsId)

                    F.db.execute(frontQuery)
                    F.db.commit()

                    frontQuery = """ UPDATE domain_transfer SET statusCode ='%s', statusDescription='%s' WHERE orderDetailsId = '%s' """ % (orderInfo['transferorderdetail']['statusid'],statusdesc,orderDetailsId)
                    F.frontLog(frontQuery)
                        
            time.sleep(2)

