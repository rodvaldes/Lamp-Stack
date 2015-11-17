Este directorio contiene los artefactos de la aplicación en ambiente productivo.

Entorno de Produccion 
=====================

Cloud 
Digital Ocean

CentOS
Apache 
MySql 
PHP

Startup de Maquina
==================

ssh a la m‡quina
sudo dpkg-reconfigure tzdata
sudo apt-get update
sudo apt-get install puppet-common
sudo apt-get install git
sudo git clone https://github.com/roxtrongo/Lamp-Stack.git
sudo mv /etc/puppet ~
sudo cp -rf Lamp-Stack/Produccion/puppet /etc
sudo puppet apply /etc/puppet/manifests/config.pp
