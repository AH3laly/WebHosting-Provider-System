#!/usr/bin/python2
# Author: Abdelrahman Mohamed
# Contact: < Abdo.Tasks@Gmail.Com , https://Github.com/abd0m0hamed >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

import time
import framework as F
import templates
from datetime import date,datetime
from models import sl,whm

class package:

    def checkExpiring(self):

        today = date.today()

        q = """ SELECT p.id, p.notifyDate, p.dueDate, p.expireDate, p.isAutoRenew, p.autoRenewAgreement, p.autoRenewMethod, p.type AS packageType, p.ispId, p.autoRenewError, type, c.email, p.domain, p.cpanelBillingItemId 
            FROM customerPackage AS p
            LEFT JOIN customerShadow AS c ON c.userId = p.customerId
            WHERE p.dueDate <= '%s' AND isExpired = 0 """ % (today.isoformat())
    

        stmt = F.db.execute(q)
    
        if(stmt==False):
            return False

        packages = stmt.fetchall()

        for (id,notifyDate,dueDate,expireDate,isAutoRenew, autoRenewAgreement, autoRenewMethod, packageType, ispId, autoRenewError, type, email, domain, cpanelBillingItemId) in packages:

            dDate = datetime.strptime(str(dueDate),"%Y-%m-%d").date()
            xDate = datetime.strptime(str(expireDate),"%Y-%m-%d").date()
        
            if(today >= xDate):

                #Update Package Status To Expired
                F.db.execute(""" UPDATE customerPackage SET isExpired = 1 WHERE id = '%s' """ % id)
                F.db.commit()

                if(type=='domain'):
                    F.mailer.pushMessage(email,'Domain Expired '+domain,templates.emails['domainExpired'] % (domain))
            frontQuery = """ UPDATE customer_domain SET isExpired = 1 WHERE dmzId = '%s' """ % str(id)
                F.frontLog(frontQuery)
                else:
                    pkInfo = dict({'id':id,'type':type,'ispId':str(ispId),'cpanelBillingItemId':cpanelBillingItemId})
                    self.terminate(pkInfo)
                    F.mailer.pushMessage(email,'Package Expired '+domain,templates.emails['packageExpired'] % (domain))

            elif (today >= dDate):
                #Package is Running in the Due Date
                #Set Notify Date of the Package To Today
                F.db.execute(""" UPDATE customerPackage SET notifyDate = %s WHERE id = %s """,(today,id))
                F.db.commit()

                if(isAutoRenew==0):
                    #Push Message to Send
                    if(str(notifyDate) != str(today)):
                        params = dict({'id':id,'email':email,'domain':domain,'expireDate':str(expireDate),'today':str(today),'type':type})
                        self.notifyExpiring(params)

                if(autoRenewError):
                    #Push Message to Send
                    if(str(notifyDate) != str(today)):
                        params = dict({'id':id,'email':email,'domain':domain,'expireDate':str(expireDate),'today':str(today),'type':type})
                        self.notifyAutorenewError(params)

            time.sleep(2)

    def notifyExpiring(self,params):
        if(params['type']=='domain'):
            F.mailer.pushMessage(params['email'],'Domain Expiring',templates.emails['domainExpiring'] % (params['domain'],params['expireDate']))
        else:
            F.mailer.pushMessage(params['email'],'Package Expiring',templates.emails['packageExpiring'] % (params['domain'],params['expireDate']))

    def notifyAutorenewError(self,params):
        if(params['type']=='domain'):
            F.mailer.pushMessage(params['email'],'Domain Auto-renewal Process Failed',templates.emails['domainAutoRenewalFailed'] % (params['domain'],params['expireDate']))
        else:
            F.mailer.pushMessage(params['email'],'Package Auto-renewal Process Failed',templates.emails['packageAutoRenewalFailed'] % (params['domain'],params['expireDate']))



    def terminate(self,packageInfo):
    
    if((packageInfo['type']=='vps' or packageInfo['type']=='dedicated') and packageInfo['cpanelBillingItemId']):
        sl.cancelCpanelLicense(packageInfo['cpanelBillingItemId'])

        if(packageInfo['type']=='vps'):
            sl.terminateVirtual(packageInfo['ispId'])

        elif(packageInfo['type']=='dedicated'):
            sl.terminateHardware(packageInfo['ispId'])

    elif(packageInfo['type']=='shared' or packageInfo['type']=='reseller'):

        #Get Cpanel Account Info
        q = """ SELECT id,userName,domain FROM cpAccounts WHERE packageId = '%s' """
        stmt = F.db.execute(q % str(packageInfo['id']))

        if(stmt==False):
        F.log('Invalid Cpanel Package '+q % packageInfo['id'])
        return False
        
        cpAcctInfo = stmt.fetchone()

        """
        if(not cpAcctInfo[0]):
            F.log('Invalid Cpanel Account Package'+q % packageInfo[0])
        F.log(cpAcctInfo[0]+cpAcctInfo[1]+cpAcctInfo[2])
        return False
        """

        F.db.execute(""" UPDATE cpAccounts SET isActive = 0 WHERE packageId = '%s' """ % str(packageInfo['id']))
            F.db.commit()

        whm.accountSuspend(cpAcctInfo[1])

    #Push Updates to Frontend
    frontQuery = """ UPDATE customer_package SET isExpired = 1 WHERE dmzId = '%s' """ % str(packageInfo['id'])
        F.frontLog(frontQuery)

