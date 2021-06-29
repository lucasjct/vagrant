# Vagrant
Projeto infraestrutura como código utilizando Vagrant  

***   

!["logo"](./image/logo.svg)

* Vagrant é uma ferramenta que permite criar e gerenciar máquina virtuais de maneira eficiente.  

* Toda configuração fazemos no arquivo [__Vagrantfile__](https://www.vagrantup.com/, "Site do Vagrant"). Através dele, podemos definir qual sistema operacional queremos subir, disponibilizar de recursos de hardware, configurar ambiente de desenvolvimento, servidores, etc.  

* É uma das ferramenta IaC - Infrastructure as Code, ou seja, com código e neste caso escrito no Vagrantfile, posso provisionar um ambiente de desenvolvimento.

* o Vagrant aceita diversos __provisions__, neste projeto, utilizamos *Ansible*, *Puppet* e *Shell*. Ele também possui seus __providers__, que são os hypervions das máquinas virtuais. Por padrão, ele possui suporte para __VirtualBox__ da Oracle.   

### Executar o projeto:  

Instalar as dependências:   
* [VirtualBox](https://www.virtualbox.org/) 
:  
`sudo apt-get install virtualbox`  
* [Vagrant](https://www.vagrantup.com/):  
`sudo apt-get install vagrant`  

No diretório clonado, executar os comandos:  

Para subir o projeto:
* `vagrant up`  

Para verificar o status da Máquina Virtual:  
* `vagrant status`  

Para verificar o status da Máquina Virtual de maneira global (consultar em qualquer diretório):  
* `vagrant global-status` 

Para entrar na Máquina Virtual:  
* `vagrant ssh`  

Verificar a release da Máquina Virtual:  
* `vagrant ssh -config`   

Para desligar a Máquina Virtual:   
* `vagrant halt`   

Para destroir a Máquina Virtual:   
* `vagrant destroy`    

Listar todos os Box:   
* `vagrant box list`     

Remover um Box:  
`vagrant box remove <nome-do-box>`   

Visualizar apenas máquinas configuradas  
`vagrant global-status --prune`