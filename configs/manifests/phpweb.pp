# O Puppet é uma ferramenta para provisionar uma máquina virtual


# execute 'apt-get update', sempre é importante para autalizar os diretórios do ubuntu
exec { 'apt-update':                    # exec resource named 'apt-update'
  command => '/usr/bin/apt-get update'  # command this resource will run
}

# install apache2 package
package { ['php7.2', 'php7.2-mysql']:
  require => Exec['apt-update'],        # require 'apt-update' before installing
  ensure => installed,
}

exec { 'run-php7':                    
   require => Package['php7.2'],
   command => '/usr/bin/php -S 0.0.0.0:8888 -t /vagrant/src &',  
}
