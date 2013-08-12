yumrepo { 'epel':
  name => 'epel',
  descr => 'Extra Packages for Enterprise Linux 6 - $basearch',
  mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
  enabled => 1,
  failovermethod => 'priority',
  gpgcheck => 1,
  gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
}

exec {'import-key':
  command => '/bin/rpm --import https://fedoraproject.org/static/0608B895.txt',
  require => Yumrepo['epel'],
}