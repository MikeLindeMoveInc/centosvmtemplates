package { 'erlang':
  ensure => installed,
}

exec { 'import-key':
  command => '/bin/rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc',
  require => Package['erlang'],
}

package { 'rabbitmq-server':
  ensure   => installed,
  source   => 'http://www.rabbitmq.com/releases/rabbitmq-server/v3.1.1/rabbitmq-server-3.1.1-1.noarch.rpm',
  require  => Exec['import-key'],
  provider => rpm,
}

exec { 'enable-plugins':
  command => '/usr/sbin/rabbitmq-plugins enable rabbitmq_management',
  require => Package['rabbitmq-server'],
  notify  => Service['rabbitmq-server'],
  environment => 'HOME=/root',
}

service { 'rabbitmq-server':
  ensure     => running,
  enable     => true,
  hasstatus  => true,
  hasrestart => true,
  require    => Package['rabbitmq-server'],
}
