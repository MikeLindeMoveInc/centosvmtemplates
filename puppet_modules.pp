file { 'puppet-modules-dir':
  ensure => directory,
  path => '/etc/puppet/modules/',
}

exec { 'puppetlabs-firewall-module':
  command => '/usr/bin/puppet module install puppetlabs/firewall --force',
  require => File['puppet-modules-dir'],
}

exec { 'puppetlabs-stdlib-module' :
  command => '/usr/bin/puppet module install puppetlabs/stdlib --force',
  require => File['puppet-modules-dir'],
}