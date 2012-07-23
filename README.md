Description
===========
Chef Cookbook for installing sbt.  Right now only supports ubuntu.

Requirements
============
apt, java

Attributes
==========
There is only one attribute, scala_sbt[:repo_url], and you shouldn't have to 
modify it unless the version changes or the package moves.

Usage
=====
Knife upload it, put it in a runlist, go to town.
