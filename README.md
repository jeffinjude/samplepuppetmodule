# samplepuppetmodule

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with samplepuppetmodule](#setup)
    * [What samplepuppetmodule affects](#what-samplepuppetmodule-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with samplepuppetmodule](#beginning-with-samplepuppetmodule)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview
This puppet module installs java 8, tomcat7,Mysql Ver 14.14 Distrib 5.7.16 on ubuntu 16.04 nodes and deploys a spring web application on 8080 port. Uses puppet version 3.8.5.

## Module Description

* Install java 8, tomcat7,Mysql Ver 14.14 Distrib 5.7.16
* Configures mysql db for the spring application
* Deploys the spring web application on port 8080

## Setup

### What samplepuppetmodule affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements **Required**

Install puppetlabs/mysql module. Run command 'puppet module install puppetlabs-mysql --version 3.10.0' to install it.

### Beginning with samplepuppetmodule
#### Steps:
##### Puppet Master:
* Install puppetmaster on the master node.
* Install puppetlabs/mysql module.
* Place this module directory in path /etc/puppet/modules
* In site.pp file (/etc/puppet/manifests/) specify the nodes to which the module should be applied.
	<br>Eg : <br>
	node 'ip-172-31-12-157.us-west-1.compute.internal' {<br>
	include samplepuppetmodule<br>
	}<br>
	node 'ip-172-31-7-57.us-west-1.compute.internal' {<br>
	include samplepuppetmodule<br>
	}<br>
   Add the node domain names to hosts file (/etc/hosts):<br>
   54.67.124.62 ip-172-31-12-157.us-west-1.compute.internal<br>
   54.67.126.56 ip-172-31-7-57.us-west-1.compute.internal<br>
* Configure the puppet file server (/etc/puppet/fileserver.conf) to point to directory /etc/puppet/

##### Puppet Agents:
* Install puppet on agents
* Add the puppet server domain name to hosts file
* In puppet conf file (/etc/puppet/puppet.conf) add the domain name of puppetmaster as server:<br>
   server=ip-172-31-5-63.us-west-1.compute.internal
* Ensure that ports 8080, 3306, 8140 ports are open on the agents.
* Run command 'puppet agent --enable' as sudo
* Run command 'puppet agent --no-daemonize --onetime --verbose' as sudo to do an initial puppet run.
* After inital puppet run go to master and run command 'puppet cert list' to list the agent certificate.
* Run command 'puppet cert sign <certificate_name>' on master to sign the certificate.
* Now again run 'puppet agent --no-daemonize --onetime --verbose' as sudo on puppet agent.

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
