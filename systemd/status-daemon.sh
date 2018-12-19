#!/usr/bin/bash
# Author: Abdelrahman Mohamed
# Contact: < Abdo.Tasks@Gmail.Com , https://Github.com/abd0m0hamed >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

systemctl -l status WebHostingCartProcessor
systemctl -l status WebHostingExpiringPackages
systemctl -l status WebHostingTransferringDomains
systemctl -l status WebHostingHeartbeat
systemctl -l status WebHostingMailer
