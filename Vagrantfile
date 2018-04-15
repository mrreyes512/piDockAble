Vagrant.configure("2") do |config|
  config.vm.define "piDAK"
  config.vm.box = "generic/debian9"
  config.vm.hostname = "piDAK-0"
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
  config.vm.provider "virtualbox" do |v|
    v.name = "piDAK"
    v.cpus = 1

  end

end
