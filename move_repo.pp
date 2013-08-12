yumrepo { 'move':
  name     => 'move',
  descr    => 'Move Sales Inc. move',
  baseurl  => 'http://paz02adm916.sites.homestore.net/move/$basearch/',
  gpgcheck => 0,
  gpgkey   => 'file:///etc/pki/rpm-gpg/MOVE-move-GPG-KEY',
  enabled  => 1,
}

yumrepo { 'move-system':
  name     => 'move-system',
  descr    => 'Move Sales Inc. move',
  baseurl  => 'http://paz02adm916.sites.homestore.net/move-system/$basearch/',
  gpgcheck => 0,
  gpgkey   => 'file:///etc/pki/rpm-gpg/MOVE-GPG-KEY',
  enabled  => 1,
}
