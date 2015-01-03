#!/bin/bash
STAMP="/home/vagrant/.$(basename $0)"
echo $STAMP
if [ ! -f $STAMP ]; then
  set -e

  service hhvm restart
  pushd /vagrant > /dev/null
  if [ ! -s /vagrant/composer.phar ]; then
    curl -sS https://getcomposer.org/installer | hhvm --php -dHttp.SlowQueryThreshold=30000
  fi

  hhvm -v ResourceLimit.SocketDefaultTimeout=300 -v Http.SlowQueryThreshold=900000 -v Eval.Jit=false /vagrant/composer.phar --no-interaction install -vvv

  popd > /dev/null
  touch $STAMP
fi
