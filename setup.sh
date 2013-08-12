#! /bin/bash

rpm -ivh http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm
yum install puppet -y
puppet apply selinux_disable.pp
puppet apply puppet_modules.pp
puppet apply iptables_clear.pp
puppet apply epel_rpm.pp
puppet apply move_repo.pp
puppet apply webmin.pp
puppet apply createuser.pp
puppet apply samba.pp
puppet apply nodejs.pp
puppet apply freetds.pp
puppet apply mongodb.pp
puppet apply rvm.pp
puppet apply rabbitmq.pp