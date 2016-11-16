#This class installs tomcat7
class samplepuppetmodule::tomcat7_install{
  package { 'tomcat7' :
  ensure  => installed,
  require => Class['java_install'],
  }
  service { 'tomcat7' :
  ensure     => running,
  hasstatus  => true,
  hasrestart => true,
  require => Package['tomcat7']
  }

  if $::ipaddress == '172.31.7.57'
  {
  package { 'authbind' :
  ensure  => installed
  }
  file { '/var/lib/tomcat7/conf/server.xml' :
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///modules/samplepuppetmodule/server.xml',
    require => Package['tomcat7'],
    notify => Service['tomcat7']
  }
  file { '/etc/default/tomcat7' :
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///modules/samplepuppetmodule/tomcat7',
    require => Package['tomcat7'],
    notify => Service['tomcat7']
  }
  }
}

