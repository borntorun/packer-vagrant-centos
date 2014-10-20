# packer-vagrant-centos

> Packer template(s) for creating CentOS VirtualBox machines for unnatended instalations exporting as Vagrant boxes
<hr>

### Requirements

You will need the following software installed in your system:

  - [Packer](http://www.packer.io/)
  - [Vagrant](http://www.vagrantup.com/)
  - [VirtualBox](https://www.virtualbox.org/)
	
### Versions used

	Packer v0.7.1
	VirtualBox 4.3.12 r.93733
	Vagrant 1.6.5

### How to use
	
* Centos7-devel-x86_64
	- Packages installed plus from core: @base @perl-runtime @ruby-runtime @development 
	
	- To use the box
```	
		$ 
```	
	
	- To build the box
```	
		$ cd x86_64 && packer validate packer.json && packer build packer.json
```	

### Author

	João Carvalho, 2014
