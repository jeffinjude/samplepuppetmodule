#This class would install mysql, create database and tables.
#Note that puppetlabs/mysql module should be installed.Run command 'puppet module install puppetlabs-mysql --version 3.10.0'.
class samplepuppetmodule::mysql_install{

class { 'mysql::server':
    root_password => 'root',
}

file { '/etc/mysql/sql/DbSql.sql' :
  owner   => root,
  group   => root,
  mode    => '0644',
  source  => 'puppet:///modules/samplepuppetmodule/DbSql.sql',
  require => Class['mysql::server'],
}

file { '/etc/mysql/sql/' :
  ensure => directory,
}

mysql::db { 'springdemo':
    user     => 'root',
    password => 'root',
    host     => '127.0.0.1',
    grant    => ['SELECT', 'UPDATE','CREATE','DELETE'],
    sql      => '/etc/mysql/sql/DbSql.sql',
}
}
