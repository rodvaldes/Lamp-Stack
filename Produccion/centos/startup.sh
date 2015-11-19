!/bin/bash

yes | yum -y update
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yes | yum -y install puppet
yes | yum -y install git
git clone https://github.com/roxtrongo/Lamp-Stack.git
mv Lamp-Stack/Produccion/centos/puppet /etc/
puppet apply /etc/puppet/manifests/init.pp