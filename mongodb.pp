yumrepo { '10gen-repo':
  name => '10gen',
  descr => '10gen Repository',
  baseurl => 'http://downloads-distro.mongodb.org/repo/redhat/os/x86_64',
  enabled => 1,
  gpgcheck => 0,
}

package { 'mongo-10gen':
  ensure => installed,
  require => Yumrepo['10gen-repo'],
}

package { 'mongo-10gen-server':
  ensure => installed,
  require => Yumrepo['10gen-repo'],
}

service { 'mongod':
  ensure => running,
  enable => true,
  hasstatus => true,
  hasrestart => true,
  require => Package['mongo-10gen-server'],
}
