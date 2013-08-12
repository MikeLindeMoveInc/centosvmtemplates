package { 'repoforge':
  ensure => present,
  name => 'repoforge',
  source => 'http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm',
  provider => rpm,
}

package { 'freetds':
  ensure => installed,
  require => Package['repoforge']
}
