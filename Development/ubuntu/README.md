## Vargant Ubuntu ##·

Acá los artefactos de configuración para levantar el sitio localmente 
para desarrollo. 


###Entorno de Desarrollo###

* Vagrant 
* VirtualBox


###En el host###
==========
sudo mkdir Virtualweb
sudo cd Virtualweb
sudo git clone https://github.com/roxtrongo/Lamp-Stack.git
sudo cd Desarrollo
sudo vagrant up
vagrant ssh

Provisioning
===========
https://stefanscherer.github.io/access-private-github-repos-in-vagrant-up/

1-. SSH Agent Forwarding: Agregar en el Vagrantfile:

config.ssh.forward_agent = true

2.- Agregar la llave a la máquina en momento de provisioning vía SHELL script.

 ssh-keyscan -H github.com >> ~/.ssh/known_hosts 

Esto es para poder hacer el clone desde un repositorio privado.

Ejemplo de Vagrantfile

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|  
  config.vm.box = "boxcutter/ubuntu1404"
  config.ssh.forward_agent = true

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y git
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    ssh-keyscan -H github.com >> ~/.ssh/known_hosts
    ssh -T git@github.com
    git clone git@github.com:you/your-private-repo
  SHELL
end  





En la VM
========

sudo apt-get update
sudo apt-get install git
sudo git clone https://github.com/roxtrongo/Lamp-Stack.git
sudo mv /etc/puppet ~
sudo cp -rf Lamp-Stack/Produccion/puppet /etc
sudo puppet apply /etc/puppet/manifests/config.pp
