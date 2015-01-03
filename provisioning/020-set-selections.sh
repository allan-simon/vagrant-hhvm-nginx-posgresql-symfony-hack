#!/bin/bash
STAMP="/home/vagrant/.$(basename $0)"
echo $STAMP
  # Prepare Mysql password for root DB user (defaults to no password)
debconf-set-selections << _EOF
mysql-server-5.5 mysql-server/root_password password ${ROOT_DBUSER_PASSWORD}
mysql-server-5.5 mysql-server/root_password seen true
mysql-server-5.5 mysql-server/root_password_again password ${ROOT_DBUSER_PASSWORD}
mysql-server-5.5 mysql-server/root_password_again seen true
_EOF
