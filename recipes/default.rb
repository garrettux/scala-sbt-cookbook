#
# Cookbook Name:: scala-sbt
# Recipe:: default
#

include_recipe "java"
include_recipe "apt" if platform?("debian","ubuntu")
include_recipe "yum" if platform?("redhat", "centos", "scientific", "fedora", "arch", "suse")

if platform?("redhat", "centos", "scientific", "fedora", "arch", "suse")
  
  target_file = "#{Chef::Config[:file_cache_path]}/sbt_remote.rpm"

  remote_file target_file do
	source "#{node[:scala_sbt][:repo_url]}/#{node[:scala_sbt][:sbt_version]}/#{node[:scala_sbt][:redhat]}"
    action :create
	backup false
  end

  rpm_package "sbt" do
    source target_file
    action :install
  end

else

  target_file = "#{Chef::Config[:file_cache_path]}/sbt_remote.deb"
  
  remote_file target_file do
    source  "#{node[:scala_sbt][:repo_url]}/#{node[:scala_sbt][:sbt_version]}/#{node[:scala_sbt][:debian]}"
    action :create
    backup false
  end

  package target_file do
    provider Chef::Provider::Package::Dpkg
    action :install
    source target_file
    options "--force-all"
    notifies :run, "execute[apt-get update]", :immediately
  end
end

package "sbt"
