# First create the user, use the 'user' type.
# See http://reductivelabs.com/trac/puppet/wiki/TypeReference#id229

group { 'admin':
  ensure => 'present',
  gid    => '1000',
}


user { "cyberuser":
   groups => 'admin',
   comment => 'This user was created by Puppet',
   ensure => 'present',
   managehome => 'true',
   shell => '/bin/bash',
}

package { "git":
    ensure => "latest"
}

package { "vim":
    ensure => "latest"
} 
