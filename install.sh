#!/usr/bin/bash
# Author: Abdelrahman Mohamed
# Contact: < Abdo.Tasks@Gmail.Com , https://Github.com/abd0m0hamed >
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
