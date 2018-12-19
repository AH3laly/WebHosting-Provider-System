#!/usr/bin/bash
# Author: Abdelrahman Mohamed
# Contact: < Abdo.Tasks@Gmail.Com , https://Github.com/abd0m0hamed >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

systemctl start WebHostingCartProcessor
systemctl start WebHostingExpiringPackages
systemctl start WebHostingTransferringDomains
systemctl start WebHostingHeartbeat
systemctl start WebHostingMailer
