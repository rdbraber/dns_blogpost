#!/bin/bash

# Install the bind server and the bind utilities

yum -y install bind bind-utils

# Copy the files for the master to the right location
# and start the DNS service
# Add DNS servers to the resolv.conf file
# Restart the network

if [ "`hostname -s `" = "rac01" ]
then 
  cp -p /vagrant/rac01/etc/named.conf /etc/named.conf
  chown root:named /etc/named.conf
  cp -p /vagrant/rac01/var/named/example.com /var/named
  chown root:named /var/named/example.com
  cp -p /vagrant/rac01/var/named/20.168.192.in-addr.arpa /var/named
  chown root:named /var/named/20.168.192.in-addr.arpa

  service named start
  chkconfig named on

  echo "DNS1=192.168.20.101" >> /etc/sysconfig/network-scripts/ifcfg-eth0
  echo "DNS2=192.168.20.102" >> /etc/sysconfig/network-scripts/ifcfg-eth0

  service network restart  
fi

# Copy the file for the slave to the right location
# and start the DNS service
# Add DNS servers to the resolv.conf file
# Restart the network

if [ "`hostname -s `" = "rac02" ]
then
  cp -p /vagrant/rac02/etc/named.conf /etc/named.conf
  chown root:named /etc/named.conf

  systemctl start named.service
  systemctl enable named.service

  echo "DNS1=192.168.20.101" >> /etc/sysconfig/network-scripts/ifcfg-enp0s3
  echo "DNS2=192.168.20.102" >> /etc/sysconfig/network-scripts/ifcfg-enp0s3
  
  if grep -q PEERDNS /etc/sysconfig/network-scripts/ifcfg-enp0s3
  then
    sed -i 's/^PEERDNS.*/PEERDNS=no/' /etc/sysconfig/network-scripts/ifcfg-enp0s3
  else
    echo "PEERDNS=no" >> /etc/sysconfig/network-scripts/ifcfg-enp0s3
  fi
  service network restart
fi
