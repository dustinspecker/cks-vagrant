# -*- mode: ruby -*-
# vi: set ft=ruby :

# vagrant-disksize plugin is required to specify disk size
# https://askubuntu.com/a/1209925
unless Vagrant.has_plugin?("vagrant-disksize")
    raise Vagrant::Errors::VagrantError.new, "vagrant-disksize plugin is missing. Please install it using 'vagrant plugin install vagrant-disksize' and rerun 'vagrant up'"
end

INSTALL_SCRIPT = ENV['INSTALL_SCRIPT'] || "latest"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.disksize.size = '50GB'

  config.vm.box_check_update = false

  # Provision master node
  config.vm.define "cks-master" do |node|
    node.vm.provider "virtualbox" do |vb|
        vb.name = "cks-master"
        vb.memory = 4096
        vb.cpus = 4
    end
    node.vm.hostname = "cks-master"
    node.vm.network :private_network, ip: "192.168.5.10"
    node.vm.network "forwarded_port", guest: 22, host: "2710"

    node.vm.provision "setup-etc-hosts", type: "shell", path: "scripts/setup-etc-hosts.sh" do |s|
      s.args = ["192.168.5.10"]
    end

    node.vm.provision "install-master", type: "shell", env: {"INSTALL_SCRIPT" => INSTALL_SCRIPT}, path: "scripts/install-master.sh"
  end

  # Provision worker nodes
  config.vm.define "cks-worker" do |node|
      node.vm.provider "virtualbox" do |vb|
          vb.name = "cks-worker"
          vb.memory = 4096
          vb.cpus = 4
      end
      node.vm.hostname = "cks-worker"
      node.vm.network :private_network, ip: "192.168.5.20"
      node.vm.network "forwarded_port", guest: 22, host: "2720"

      node.vm.provision "setup-etc-hosts", type: "shell", path: "scripts/setup-etc-hosts.sh" do |s|
        s.args = ["192.168.5.20"]
      end

      node.vm.provision "install-worker", type: "shell", path: "https://raw.githubusercontent.com/killer-sh/cks-course-environment/master/cluster-setup/#{INSTALL_SCRIPT}/install_worker.sh"
  end
end
