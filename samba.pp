file {'devroot-dir':
  ensure => directory,
  path => '/var/devroot/',
  mode => 0664,
  group => 'movedev',
  owner => 'movedev',
}

package {'samba':
  ensure => installed,
}

package {'samba-common':
  ensure => installed,
}

exec {'/usr/bin/printf "P@ssw0rd\nP@ssw0rd\n" | /usr/bin/pdbedit -a -t movedev':}

file {'samba-config-dir':
  ensure => directory,
  path => '/etc/samba/smb.conf.d/',
  mode => 0644,
  group => 'root',
  owner => 'root',
  require => Package['samba'],
}

file {'devroot-conf':
  ensure => file,
  path => '/etc/samba/smb.conf.d/devroot.conf',
  content => '[devroot]
path=/var/devroot
browseable=yes
read only=no
comment=Development Root',
  require => Package['samba'],
}

file_line {'smb.conf':
  path => '/etc/samba/smb.conf',
  line => 'include=/etc/samba/smb.conf.d/devroot.conf',
  require => File['devroot-conf'],
  notify => Service['smb'],
}

service {'smb':
  ensure => running,
  enable => true,
  hasstatus => true,
  hasrestart => true,
}
