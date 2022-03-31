#!/bin/bash

base_command="firewall-cmd --permanent --zone=public"

# Disable unwanted services
$base_command --remove-service={dhcpv6-client,ssh}

# Enable http and https
$base_command --add-service=http{,s}

# Enable ipv4 packet forwarding
echo "net.ipv4.ip_forward = 1" > /etc/sysctl.conf
sysctl -w net.ipv4.ip_forward=1
