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
}

