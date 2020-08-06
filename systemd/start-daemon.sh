#!/usr/bin/bash
# Author: Abdelrahman Helaly
# Contact: < AH3laly@gmail.com , https://Github.com/AH3laly >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

systemctl start WebHostingCartProcessor
systemctl start WebHostingExpiringPackages
systemctl start WebHostingTransferringDomains
systemctl start WebHostingHeartbeat
systemctl start WebHostingMailer
