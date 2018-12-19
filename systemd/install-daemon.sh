#!/usr/bin/bash
# Author: Abdelrahman Mohamed
# Contact: < Abdo.Tasks@Gmail.Com , https://Github.com/abd0m0hamed >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

cp -f /WebHosting/daemon/WebHostingCartProcessor.service /usr/lib/systemd/system/
cp -f /WebHosting/daemon/WebHostingExpiringPackages.service /usr/lib/systemd/system/
cp -f /WebHosting/daemon/WebHostingTransferringDomains.service /usr/lib/systemd/system/
cp -f /WebHosting/daemon/WebHostingHeartbeat.service /usr/lib/systemd/system/
cp -f /WebHosting/daemon/WebHostingMailer.service /usr/lib/systemd/system/
systemctl daemon-reload

systemctl enable WebHostingCartProcessor
systemctl enable WebHostingExpiringPackages
systemctl enable WebHostingTransferringDomains
systemctl enable WebHostingHeartbeat
systemctl enable WebHostingMailer

systemctl start WebHostingCartProcessor
systemctl start WebHostingExpiringPackages
systemctl start WebHostingTransferringDomains
systemctl start WebHostingHeartbeat
systemctl start WebHostingMailer

systemctl status WebHostingCartProcessor
systemctl status WebHostingExpiringPackages
systemctl status WebHostingTransferringDomains
systemctl status WebHostingHeartbeat
systemctl status WebHostingMailer
