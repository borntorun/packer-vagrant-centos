# packer-vagrant-centos

###### Packer template(s) for creating CentOS 7 VirtualBox machines for unnatended instalations exporting as Vagrant boxes.
<hr>

### Requirements

You will need the following software installed in your system:

* [Packer](http://www.packer.io/)
* [Vagrant](http://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

### Host system and software versions used

* Windows 7 Professional 64 bit
* Packer v0.7.1
* VirtualBox 4.3.12 r.93733 and VirtualBox 4.3.18 r.96516 
* Vagrant 1.6.5
* MSYS (Minimal SYStem) provided by MinGW / GNU bash, version 3.1.20(4)-release-(i686-pc-msys)

### How to use

###### Two boxes may be created from two different kickstart files
  
* **devel** (ks-devel.cfg) 

	- The **default** box if none is specified with the **Core**, **base**, **java-platform**, **perl-runtime**, **ruby-runtime** and **development** groups of CentOS, plus some necessary development packages. 

* **minimal** (ks-minimal.cfg)

	- The **minimal** Environment of CentOS, plus some necessary packages for provisioning and installing other software. 

###### To build the box

syntax: packer build [-var ksfile=\<devel|minimal\>] packer.json

To buid the default box (devel):
```
$ cd x86_64
$ packer validate packer.json #just to test syntax of template
$ packer build packer.json
```
To buid the minimal box:
```
$ cd x86_64
$ packer validate -var ksfile=minimal packer.json #just to test syntax of template
$ packer build -var ksfile=minimal packer.json
$ packer build packer.json
```

**Note:** The build uses a portuguese mirror for the netinstall iso. Change variables in packer.json for other configs "iso_url_netinstall" and "iso_url_checksum".

###### To use the box

Add the box to cloud or some path

Syntax: vagrant box add [--name \<name>] \<path|url>Centos7-\<devel|minimal\>-x86_64.box

```
$ vagrant box add --name theboxname <path|url>Centos7-minimal-x86_64.box
```

**Note:** to Windows Users using VirtualBox 4.3.12

>Due to an error when buildind VirtualBox 4.3.12 guest additions on CentOS 7: "ERROR: Kernel configuration is invalid." the >most safe way I discovered was to use VirtualBox guest additions **v.4.3.14** on VirtualBox 4.3.12.
>
>[See here](https://forums.virtualbox.org/viewtopic.php?f=3&t=62485&start=15#p298960)
>
>[Download iso VB guest additions](http://download.virtualbox.org/virtualbox/) and put the iso in \<path_of_vitualbox_install\> usually C:\Program Files\Oracle\VirtualBox
>
>Later when build/update a vm you will receive a message that versions (host/guest) are not the same, but you can ignore it.
>
>Of course, if you can, install a version of VirtualBox \>4.3.12  on your host system...

### Author

João Carvalho, 2014
