#!/bin/bash

network="192.168.1"  # Replace with your network range
ports="20,22,80,443,"  # Define the ports to scan, separated by commas          ## Here I menioned some ports FTP, SSH, HTTP, HTTPS

for host in {1..254}; do
    target="${network}.${host}"
    for port in $(echo $ports | tr ',' ' '); do
        (echo >/dev/tcp/$target/$port) > /dev/null 2>&1 && echo "Port $port is open on $target"
    done
done
