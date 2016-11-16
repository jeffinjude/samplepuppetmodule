#This class deploys application war
class samplepuppetmodule::war_deploy {
  file { '/var/lib/tomcat7/webapps/SpringReactJsDemo.war' :
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///modules/samplepuppetmodule/SpringReactJsDemo.war',
    require => Class['tomcat7_install']
  }

  file { '/var/lib/tomcat7/webapps' :
    ensure => directory,
    require => Class['tomcat7_install']
  }
}
