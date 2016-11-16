#This class would install java 8 package
class samplepuppetmodule::java_install{
  package { 'openjdk-8-jdk' :
    ensure => installed
  }
}
