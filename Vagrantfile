# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  # Binding mounts for folders with dynamic data in them
  # This must happen before provisioning, and on every subsequent reboot, hence run: "always"
  config.vm.provision "shell",
        inline: "/vagrant/provisioning/bind-mount.sh",
        run: "always"
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
