# Vagrant
Projeto infraestrutura como código utilizando Vagrant  

***   

!["logo"](./image/logo.svg)

* Vagrant é uma ferramenta que permite criar e gerenciar máquina virtuais de maneira eficiente.  

* Toda configuração fazemos no arquivo [__Vagrantfile__](https://github.com/lucasjct/vagrant/blob/main/Vagrantfile "Vagrantfile"). Através dele, podemos definir qual sistema operacional queremos subir, disponibilizar de recursos de hardware, configurar ambiente de desenvolvimento, servidores, etc.  

* É uma das ferramenta IaC - Infrastructure as Code, ou seja, com código e neste caso escrito no Vagrantfile, posso provisionar um ambiente de desenvolvimento.

* o Vagrant aceita diversos __provisions__, neste projeto, utilizamos *Ansible*, *Puppet* e *Shell*. Ele também possui seus __providers__, que são os hypervions das máquinas virtuais. Por padrão, ele possui suporte para __VirtualBox__ da Oracle.   

## Instalar as dependências:   
* [VirtualBox](https://www.virtualbox.org/) 
:  
`sudo apt-get install virtualbox`  
* [Vagrant](https://www.vagrantup.com/):  
`sudo apt-get install vagrant`   

* Neste projeto não é necessário, porém para criar um Vagrantfile novo, executo o seguinte comando:  
`vagrant init`  
Será criado uma arquivo com uma configuração default e com informações sobre o Vagrantfile.   

* Para inicializar subir o Vagrant:
`vagrant up`  

obs: O sistema operacional criado na VM, vai ser aquele que você informar no Vagrantfile. Para escolher qual deseja, verifique os [boxes do Vagrant](https://app.vagrantup.com/boxes/search).  

Os boxes serão informados neste primeiro bloco de código. Aqui, colocamos no Vagrantfile gerado a opção: "ubuntu/bionic64".   

```Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
        config.vm.provider "virtualbox" do |vb|
        vb.memory = 512
        vb.cpus = 1
    end
```
***  

### Executar este projeto: 

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

* Listar todos os Box:   
 `vagrant box list`     

* Remover um Box:  
`vagrant box remove <nome-do-box>`   

* Visualizar apenas máquinas configuradas:  
`vagrant global-status --prune`  

* Validar o arquivo Vagrantfile:   
`vagrant validate` 