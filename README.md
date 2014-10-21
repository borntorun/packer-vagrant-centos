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
    - Guest system CentOS 7 - 64 bit

	- Packages installed plus from core
		- @base
		- @perl-runtime
		- @ruby-runtime
		- @development 
		- ... see ks.cfg to more...
    	
	- To build the box
		- $ cd x86_64
		- $ packer validate packer.json
		- $ packer build packer.json
		
			- Note: 
				- The build uses a portuguese mirror for the netinstall iso.
				- Change variables in packer.json for other configs "iso_url_netinstall" and "iso_url_checksum"
				
	- To use the box
		- Add the box to cloud or some path
		- $ vagrant box add [--name \<name>] \<path|url>Centos7-devel-x86_64.box
	
	- Note to Windows Users
		- Due to an error when buildind VirtualBox guest additions on CentOS 7: "ERROR: Kernel configuration is invalid." the most safe way I discovered was to use VirtualBox guest additions v.4.3.14 on VirtualBox 4.3.12.
		- [See here](https://forums.virtualbox.org/viewtopic.php?f=3&t=62485&start=15#p298960)
		- [Download iso VB guest additions](http://download.virtualbox.org/virtualbox/) and put the iso in <path_to_vitualbox_install> usually C:/Program Files/Oracle/VirtualBox
		- Later when build/update a vm you will receive a message that versions (host/guest) are not the same, but you can ignore it.
		- Of course you can install a newer version of VirtualBox on host system and see what happens...

### Author

	João Carvalho, 2014
