# Vagrant
Projeto infraestrutura como código utilizando Vagrant  

***  

* Vagrant é uma ferramenta que permite criar e gerenciar máquina virtuais de maneira eficiente.  

* Toda configuração fazemos no arquivo __Vagrantfile__. Através dele, podemos definir qual sistema operacional queremos subir, quanto de recursos queremos disponibilizar, configurar ambiente de desenvolvimento, servidores, etc.  

* É uma das ferramente IaC - Infrastructure as Code, ou seja, com código posso provisionar um ambiente de desenvolvimento.

* o Vagrant aceita diversos __provisions__, neste projeto, utilizamos Ansible, Puppet e Shell. Ele também possui seus __providers__, que são os hypervions das máquinas virtuais. Por padrão, ele possui suporte para __VirtualBox__ da Oracle.   

### Executar o projeto: