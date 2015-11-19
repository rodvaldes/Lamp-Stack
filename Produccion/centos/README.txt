yum update
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yes | yum -y install puppet
mkdir -p /etc/puppet/manifests
cat >/etc/puppet/manifests/projectname.pp

node "cybersyn.com" {

file { '/root/example_file.txt':
    ensure => "file",
    owner  => "root",
    group  => "root",
    mode   => "700",
    content => "Congratulations!
Puppet has created this file.
",}

} # End node mynode.example.com
puppet apply /etc/puppet/manifests/projectname.pp



