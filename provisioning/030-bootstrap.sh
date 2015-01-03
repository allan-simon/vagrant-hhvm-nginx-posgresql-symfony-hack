#!/bin/bash
STAMP="/home/vagrant/.$(basename $0)"
echo $STAMP
if [ ! -f $STAMP ]; then
  export DEBIAN_FRONTEND="noninteractive" ; set -e -x

  #wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
  #echo deb http://dl.hhvm.com/debian wheezy main | tee /etc/apt/sources.list.d/hhvm.list
  wget -O - http://mirrors.hypo.cn/hhvm/conf/hhvm.gpg.key | apt-key add -
  echo deb http://mirrors.hypo.cn/hhvm/ubuntu trusty main | tee /etc/apt/sources.list.d/hhvm.list
  APT="apt-get -y -o DPkg::Options::=--force-confdef -o DPkg::Options::=--force-confold -o APT::Get::force-yes=true"

  #Avoid a few common cases of dependency version drift
  $APT update

  # #Install 
  $APT install hhvm nginx postgresql curl

  touch $STAMP
fi
