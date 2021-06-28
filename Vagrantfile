Vagrant.configure("2") do |config|
# Escolha de qual SO desejo basear minha máquina. Buscar por Boxes na doc.
    config.vm.box = "ubuntu/bionic64"

######################## Configuração VM - SHELL COMO PROVISION ###############################
#             Instalação do Mysql                                                             #  
#                                                                                             #
#                                                                                             #                              
###############################################################################################

# Configuração multi-machine
    config.vm.define "mysql_db" do |mysql|

# Posso definir qual porta do host pode acessar a VM (Guest). Forwarded Port, por exemplo:
#    mysql.vm.network "forwarded_port", guest: 80, host: 8889 
#Public Network, que possibilita o acesso à máquina virtual por diversos computadores em uma única rede pública.
    mysql.vm.network "public_network", ip: "192.168.0.24"

# Provisions do Vagrant, configuração da chave ssh
    mysql.vm.provision "shell", 
        inline: "cat /configs/id_bionic.pub >> .ssh/authorized_keys"

    
    mysql.vm.provision "shell", path: "./configs/bash/bash_install.sh"
    mysql.vm.provision "shell", inline: "cat /configs/mysqld.cnf > /etc/mysql/mysql.conf.d/mysqld.cnf"
    mysql.vm.provision "shell", inline: "service mysql restart"

# Pastas sicronizadas (synced_folder). 
# São diretórios mapeados entre o host e os diretórios da máquina virtual:
# o exemplo abaixo é a porta config.
    mysql.vm.synced_folder "./configs", "/configs"
    mysql.vm.synced_folder ".", "/vagrant", disabled: true
end

######################## Configuração VM - PUPPET COMO PROVISION ##############################
# O Manifesto de configuração, encontra-se em: ./configs/manifests                            #  
#                                                                                             #
#                                                                                             #
#                                                                                             #                              
###############################################################################################

#Multi Machines
    config.vm.define "phpweb" do |phpweb|
        phpweb.vm.network "forwarded_port", guest: 8889, host: 8889 
        phpweb.vm.network "public_network", ip: "192.168.0.25"

# Instalação do Puppet na VM utilizando o provision bash.
        phpweb.vm.provision "shell",
         inline: "apt-get update && apt-get install -y puppet"

# Integração do Puppet com o Vagrant
    phpweb.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "./configs/manifests"
        puppet.manifest_file = "phpweb.pp"
        end
    end

######################## Configuração VM - ANSIBLE COMO PROVISION #############################
# O Manifesto de configuração, encontra-se em: ./configs/manifests                            #  
#                                                                                             #
#                                                                                             #
#                                                                                             #                              
###############################################################################################

    config.vm.define "mysqlserver" do |mysqlserver|
        mysqlserver.vm.network "public_network", ip: "192.168.1.22"
        mysqlserver.vm.provision "shell", inline: "cat /vagrant/configs/id_bionic.pub >> .ssh/authorized_keys"
        end

    config.vm.define "ansible" do |ansible|
        ansible.vm.network "public_network", ip: "192.168.0.26"
        ansible.vm.provision "shell",
        inline: "cp /vagrant/id_bionic /home/vagrant && \
                 chmod 600 /home/vagrant/id_bionic && \
                 chown vagrant:vagrant /home/vagrant/id_bionic"

        ansible.vm.provision "shell", 
        inline:"apt update -y && \
                apt install --yes software-properties-common && \
                add-apt-repository --yes --update ppa:ansible/ansible && \
                apt install -y ansible"
    end
end
# Aplicar integração: o Puppet precisa de um cliente na máquina virtual
# Puppet -> ao instalar na máquina virtual pela primeira vez, devo utilizar o comando: puppet apply /vagrant/config/manifests/phpweb.pp

  
# Estabelecer conexão ssh entre o host e VM
# No host, gerar no diretorio um par de chaves ssh com:
#ssh-keygen -t rsa

#Acessar a máquina virtual e copiar o arquivo .pub da chave gerada acima no diretório vagrant:
# vagrant ssh - acessar a VM
# cp /vagrant/id_bionic.pub . - Copiar a chave
#
# Enviar a chave gerada para o arquivo authorize_keys:
# cat id_bionic.pub >> .ssh/authorized_keys
#
# exit para sair da máquina e voltar para o host
#
# Agora, conecte na máquina com a chave gerada:
# ssh -i arquivo.pub vagrant@192.168.0.24
# ssh -i id_bionic vagrant@192.168.0.24