#!/usr/bin/bash
# Author: Abdelrahman Helaly
# Contact: < AH3laly@gmail.com , https://Github.com/AH3laly >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

systemctl -l status WebHostingCartProcessor
systemctl -l status WebHostingExpiringPackages
systemctl -l status WebHostingTransferringDomains
systemctl -l status WebHostingHeartbeat
systemctl -l status WebHostingMailer
