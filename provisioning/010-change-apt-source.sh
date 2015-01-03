#!/bin/bash
STAMP="/home/vagrant/.$(basename $0)"
echo $STAMP
if [ ! -f $STAMP ]; then
  sudo cat << _EOF > /etc/apt/sources.list
deb http://cn.archive.ubuntu.com/ubuntu/ trusty main restricted universe
deb http://cn.archive.ubuntu.com/ubuntu/ trusty-updates main restricted
deb http://security.ubuntu.com/ubuntu trusty-security main restricted
_EOF

  touch $STAMP
fi
