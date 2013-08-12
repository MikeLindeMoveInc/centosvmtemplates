yumrepo { 'webmin-repo':
  name => 'Webmin',
  descr => 'Webmin Distribution Neutral',
  mirrorlist => 'http://download.webmin.com/download/yum/mirrorlist',
  enabled => 1,
}

exec {'import-key':
  command => '/bin/rpm --import http://www.webmin.com/jcameron-key.asc',
  require => Yumrepo['webmin-repo'],
}

package { 'webmin':
  ensure => installed,
  require => Exec['import-key'],
}

service { 'webmin':
  ensure => running,
  enable => true,
  hasstatus => true,
  hasrestart => true,
  require => Package['webmin'],
}
