file { 'selinux-config':
  path => '/etc/selinux/config',
  ensure => file,
  content => 'SELINUX=disabled',
}
