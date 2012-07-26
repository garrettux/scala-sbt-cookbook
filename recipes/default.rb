#
# Cookbook Name:: scala-sbt
# Recipe:: default
#

include_recipe "java"
include_recipe "apt" if platform?("debian","ubuntu")

if platform?("redhat", "centos", "scientific", "fedora", "arch", "suse")
  repo_url = node[:scala_sbt][:repo_url][:redhat]
  target_file = "sbt_repo.rpm"
  package_provider = Chef::Provider::Package::Yum
  package_notification "execute[yum clean all]"
else
  repo_url = node[:scala_sbt][:repo_url][:debian]
  target_file = "/sbt_repo.deb"
  package_provider = Chef::Provider::Package::Dpkg
  package_notification "execute[apt-get update]"
end

remote_file "#{Chef::Config[:file_cache_path]}/#{target_file}" do
  source repo_url
  action :create_if_missing
  backup false
end

package target_file do
  provider package_provider
  action :install
  source target_file
  notifies :run, package_notification, :immediately
end

package "sbt"
