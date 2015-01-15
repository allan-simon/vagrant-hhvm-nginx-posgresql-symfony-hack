#!/bin/bash
VAGRANT_DIR=/vagrant
WEB_USER=www-data
mkdir -p "$VAGRANT_DIR"/app/downloads/
mkdir -p "$VAGRANT_DIR"/app/uploads/
mkdir -p "$VAGRANT_DIR"/app/var/
mkdir -p "$VAGRANT_DIR"/app/cache/
mkdir -p "$VAGRANT_DIR"/app/logs/

mkdir -p ~vagrant/shared/app/downloads/
mkdir -p ~vagrant/shared/app/uploads/
mkdir -p ~vagrant/shared/app/var/
mkdir -p ~vagrant/shared/app/cache/
mkdir -p ~vagrant/shared/app/logs/

chown -R $WEB_USER:$WEB_USER ~vagrant/shared

sudo mount -o bind ~vagrant/shared/app/downloads/ "$VAGRANT_DIR"/app/downloads/
sudo mount -o bind ~vagrant/shared/app/uploads/ /"$VAGRANT_DIR"/app/uploads/
sudo mount -o bind ~vagrant/shared/app/var/ "$VAGRANT_DIR"/app/var/
sudo mount -o bind ~vagrant/shared/app/cache/ "$VAGRANT_DIR"/app/cache/
sudo mount -o bind ~vagrant/shared/app/logs/ "$VAGRANT_DIR"/app/logs/
