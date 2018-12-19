#!/usr/bin/bash
# Author: Abdelrahman Mohamed
# Contact: < Abdo.Tasks@Gmail.Com , https://Github.com/abd0m0hamed >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

rm -f /usr/lib/systemd/system/WebHostingCartProcessor.service
rm -f /usr/lib/systemd/system/WebHostingExpiringPackages.service
rm -f /usr/lib/systemd/system/WebHostingTransferringDomains.service
rm -f /usr/lib/systemd/system/WebHostingHeartbeat.service
rm -f /usr/lib/systemd/system/WebHostingMailer.service

systemctl daemon-reload
