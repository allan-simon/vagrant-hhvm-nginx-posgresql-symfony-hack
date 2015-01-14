#!/bin/bash
STAMP="/home/vagrant/.$(basename $0)"
echo $STAMP
if [ ! -f $STAMP ]; then
    #ln -s /usr/bin/hhvm '/usr/bin/hhvm --php'
    
    #echo "LC_ALL=C" >> /etc/environment
    #export LC_ALL=C

    sudo cat << _EOF > /etc/hhvm/php.ini
; php options
session.save_handler = files
session.save_path = /var/lib/php5
session.gc_maxlifetime = 1440
date.timezone = UTC

; hhvm specific 
hhvm.log.level = Warning
hhvm.log.always_log_unhandled_exceptions = true
hhvm.log.runtime_error_reporting_level = 8191
hhvm.mysql.typed_results = false
; otherwise hhvm timeout after 5 seconds which breaks composer...
hhvm.resource_limit.socket_default_timeout = 300
hhvm.http.default_timeout = 30000
hhvm.http.slow_query_threshold = 30000
; https://github.com/facebook/hhvm/issues/3751
hhvm.libxml.ext_entity_whitelist = file,http
; load pgsql module
hhvm.dynamic_extensions.pdo_pgsql = /usr/lib/hhvm/pgsql.so
hhvm.dynamic_extension_path = /usr/lib/hhvm
_EOF
  cp /vagrant/provisioning/pgsql.so /usr/lib/hhvm/pgsql.so
  chmod +x /usr/lib/hhvm/pgsql.so

  sudo service hhvm restart

  touch $STAMP
fi
