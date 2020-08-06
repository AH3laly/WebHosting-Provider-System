#!/usr/bin/bash
# Author: Abdelrahman Helaly
# Contact: < AH3laly@gmail.com , https://Github.com/AH3laly >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.

hasError()
{
    echo Error Occurred.
    echo
    exit
}

mkdir -p /WebHosting/ || hasError
cp -r daemon /WebHosting/ || hasError
sh ./systemd/install-daemon.sh || hasError
echo Done.
