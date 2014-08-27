# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Ubuntu
  config.vm.box = "hashicorp/precise32"

  # setup
  config.vm.provision :shell, path: "bootstrap.sh"

  # cache apt-get on the host machine so vagrant up is faster the second time around
  # optionally run "vagrant plugin install vagrant-cachier" to install
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

end
