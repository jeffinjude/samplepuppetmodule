#This class creates an html page displaying node specific data
class samplepuppetmodule::node_details
{
  file { '/var/lib/tomcat7/webapps/nodedetails/index.html' :
                owner   => root,
                group   => root,
                mode    => '0644',
                content => "Ip Address: ${::ipaddress},OS Family: ${::osfamily}",
        }
  file { '/var/lib/tomcat7/webapps/nodedetails/' :
    ensure => directory,
  }
}
