class deploy-site {

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

# Create script directory
file { '/home/monitor/scripts':
  ensure => directory,
  owner  => 'monitor',
  group  => 'monitor',
  mode   => '0755',
}

# Download memory_check script
exec { 'download_memory_check':
  command => '/usr/bin/wget -O /home/monitor/scripts/memory_check https://raw.githubusercontent.com/henzelss/memory-check-script/main/memorycheck.sh',
  creates => '/home/monitor/scripts/memory_check',
  require => File['/home/monitor/scripts'],
}


file { '/home/monitor/src':
  ensure => directory,
  owner  => 'monitor',
  group  => 'monitor',
  mode   => '0755',
}

# Soft link
file { '/home/monitor/src/my_memory_check':
  ensure => link,
  target => '/home/monitor/scripts/memory_check',
  owner  => 'monitor',
  group  => 'monitor',
}

# Cron 
cron { 'memory_check':
  command => '/home/monitor/src/my_memory_check',
  user    => 'monitor',
  minute  => '*/10',
}

# Set timezone
file { '/etc/localtime':
  ensure => link,
  target => '/usr/share/zoneinfo/Asia/Manila',
}

# Set hostname
exec { 'set_hostname':
  command => 'hostname bpx.server.local',
  unless  => 'hostname | grep bpx.server.local',
}

}

include deploy-site