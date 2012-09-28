Description
===========
Chef Cookbook for installing sbt.  Supports redhat, centos, scientific, fedora, debian and ubuntu.
Requirements
============
apt, java

Attributes
==========
There are only two attributes, scala_sbt[:repo_url][:debian] and scala_sbt[:repo_url][:redhat], and you shouldn't have to 
modify either unless the version changes or the packages move.

Usage
=====
Knife upload it, put it in a runlist, go to town.
