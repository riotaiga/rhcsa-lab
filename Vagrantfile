Vagrant.configure("2") do |config|
  config.vm.box = "generic/rhel9"

  # RHCSA Base VM
  config.vm.define "mgmt" do |mgmt|
    mgmt.vm.hostname = "mgmt"
    mgmt.vm.network "private_network", ip: "192.168.56.10"
    mgmt.vm.provision "shell", path: "provision/rhcsabase-management.sh"
    mgmt.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
  end

  # Storage Node
  config.vm.define "storagenode" do |storagenode|
    storagenode.vm.hostname = "storagenode"
    storagenode.vm.network "private_network", ip: "192.168.56.11"
    storagenode.vm.provision "shell", path: "provision/storagenode.sh"
    storagenode.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1   
  end

  # Network Node
  config.vm.define "networknode" do |networknode|
    networknode.vm.hostname = "networknode"
    networknode.vm.network "private_network", ip: "192.168.56.12"
    networknode.vm.provision "shell", path: "provision/networknode.sh"
    networknode.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
  end

  # NFS Server
  config.vm.define "nfsserver" do |nfsserver|
    nfsserver.vm.hostname = "nfsserver"
    nfsserver.vm.network "private_network", ip: "192.168.56.13"
    nfsserver.vm.provision "shell", path: "provision/nfsserver.sh"
    nfsserver.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
  end

  # Container Host
  config.vm.define "containerhost" do |containerhost|
    containerhost.vm.hostname = "containerhost"
    containerhost.vm.network "private_network", ip: "192.168.56.14"
    containerhost.vm.provision "shell", path: "provision/containerhost.sh"
    containerhost.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
  end
end
