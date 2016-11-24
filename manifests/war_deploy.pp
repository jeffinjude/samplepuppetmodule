#This class deploys application war
class samplepuppetmodule::war_deploy {
  file { '/var/lib/tomcat7/webapps/AngularJsSPA.war' :
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///modules/samplepuppetmodule/AngularJsSPA.war',
    require => Class['tomcat7_install'],
    notify => Service['tomcat7']
  }

  file { '/var/lib/tomcat7/webapps' :
    ensure => directory,
    require => Class['tomcat7_install']
  }
}
