# packer-vagrant-centos

Packer template(s) for creating CentOS VirtualBox machines for unnatended instalations exporting as Vagrant boxes
<hr>

### Requirements

You will need the following software installed in your system:

  - [Packer](http://www.packer.io/)
  - [Vagrant](http://www.vagrantup.com/)
  - [VirtualBox](https://www.virtualbox.org/)
	
### Host system(s) and Versions used
	
	Windows 7
	Packer v0.7.1
	VirtualBox 4.3.12 r.93733
	Vagrant 1.6.5

### How to use
	
* Centos7-devel-x86_64
	- Packages installed plus from core: @base @perl-runtime @ruby-runtime @development 
	
	- To use the box
```	
		Add the box to cloud or some path
		
		$ vagrant box add --name <name> <path|url>Centos7-devel-x86_64.box
```	
	
	- To build the box
```	
		$ cd x86_64 && packer validate packer.json && packer build packer.json
```	
	- Note Windows Users
		- VirtualBox guest additions 4.3.14 were used due to a ERROR: Kernel configuration is invalid. when building the 4.3.12 version. Of course you can install a newer version of virtual box and see what happens...
		- [See here] (https://forums.virtualbox.org/viewtopic.php?f=3&t=62485&start=15#p298960)
		- [Download iso VB guest additions] (http://download.virtualbox.org/virtualbox/)


### Author

	João Carvalho, 2014
