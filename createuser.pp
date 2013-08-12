#class { 'create_user':
	user { 'movedev':
	  comment    => 'Move Development User',
	  ensure     => present,
	  home       => '/home/movedev',
	  managehome => true,
	  name       => 'movedev',
	  password   => '$6$QMn0Yo0U$ZTg4FF8RFmW9b5iugIw25WHRPzI3hg5m3huvVZO9nheqgjv1KaLjCWHYCS.Np02UzVEY5rWSpoWwWnx3Ki.7t1',
	  uid        => 600,
	}

	file { 'movedev-sudoers':
	  name     => '/etc/sudoers.d/movedev',
	  ensure   => file,
	  require => User['movedev'],
	  content  => 'movedev ALL=(ALL) ALL',
	  mode     => 0440,
	}
#}