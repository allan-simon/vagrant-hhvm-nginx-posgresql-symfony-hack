#!/bin/bash
STAMP="/home/vagrant/.$(basename $0)"
echo $STAMP
if [ ! -f $STAMP ]; then

  export DEBIAN_FRONTEND=noninteractive


  cat << EOF | su - postgres -c psql
    -- Create the database user:
    CREATE USER $DBUSER WITH PASSWORD '$DBUSER_PASSWORD';

    -- Create the database:
    CREATE DATABASE $DBNAME WITH OWNER=$DBUSER
                                 LC_COLLATE='en_US.utf8'
                                 LC_CTYPE='en_US.utf8'
                                 ENCODING='UTF8'
                                 TEMPLATE=template0;
EOF

  touch $STAMP
fi
