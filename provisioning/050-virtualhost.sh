#!/bin/bash
STAMP="/home/vagrant/.$(basename $0)"

ROOT=
echo $STAMP
if [ ! -f $STAMP ]; then
  export DEBIAN_FRONTEND="noninteractive" ; set -e #-x

  
  # TODO replace that by an actual virtualhost...
  cat > /etc/nginx/sites-available/default << _EOF
server {
    listen             80;
    server_name        hhvm.dev;
 
    root /vagrant/web;
 
    location ~ ^/(app|app_dev|config)\.php(/|\$) {
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_split_path_info ^(.+\.php)(/.*)\$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        fastcgi_param HTTPS off;
    }
}
_EOF
  service nginx restart

  touch $STAMP
fi
