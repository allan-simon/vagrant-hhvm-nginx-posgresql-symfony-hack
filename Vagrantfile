# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "~/Downloads/trusty-server-cloudimg-amd64-vagrant-disk1(1).tar.gz"
  config.vm.provision :shell, :inline => <<-END
    export PROJECT_NAME="hhvm"
    export DBUSER=$PROJECT_NAME
    export DBUSER_PASSWORD=$PROJECT_NAME
    export DBNAME=$PROJECT_NAME"_db"
    export WWW_ROOT="/vagrant/web"
    set -e
    for s in /vagrant/provisioning/???-*.sh ; do $s ; done
END
  config.vm.network :forwarded_port, host: 8088, guest: 80 #Apache server
  config.vm.hostname = "hhvm.dev"
  config.vm.box_check_update = false
  config.vm.synced_folder "./", "/vagrant", id: "vagrant-root",
    owner: "vagrant",
    group: "www-data",
    mount_options: ["dmode=775,fmode=764"]

end
