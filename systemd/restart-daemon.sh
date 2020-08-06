#!/usr/bin/bash
# Author: Abdelrahman Helaly
# Contact: < AH3laly@gmail.com , https://Github.com/AH3laly >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

systemctl stop WebHostingCartProcessor
systemctl stop WebHostingExpiringPackages
systemctl stop WebHostingTransferringDomains
systemctl stop WebHostingHeartbeat
systemctl stop WebHostingMailer
sleep 5
systemctl start WebHostingCartProcessor
systemctl start WebHostingExpiringPackages
systemctl start WebHostingTransferringDomains
systemctl start WebHostingHeartbeat
systemctl start WebHostingMailer
