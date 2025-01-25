 #Initialized packages

 package { ['vim', 'curl', 'git']:
    ensure => installed,

 }
 
# Create user "monitor"
user { 'monitor':
  ensure     => present,
  home       => '/home/monitor',
  shell      => '/bin/bash',
  managehome => true,
}

# Create required directories
file { '/home/monitor/scripts':
  ensure => directory,
  owner  => 'monitor',
  group  => 'monitor',
  mode   => '0755',
}

file { '/home/monitor/src':
  ensure => directory,
  owner  => 'monitor',
  group  => 'monitor',
  mode   => '0755',
}
