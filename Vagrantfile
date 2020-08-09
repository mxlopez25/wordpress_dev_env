Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "forwarded_port", guest: 80, host: 11000
  config.vm.provision "shell", path: "script.sh"

  # Below are listed the synced directories
  config.vm.synced_folder "content/", "/var/www/html"

  # Decomment lines below to set 
  # config.vm.provider "virtualbox" do |v|
  #   v.name = "wordpress_dev"
  # end
end
