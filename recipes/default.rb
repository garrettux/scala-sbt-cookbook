#
# Cookbook Name:: scala-sbt
# Recipe:: default
#

include_recipe "java"
include_recipe "apt" if platform?("debian","ubuntu")
include_recipe "yum" if platform?("redhat", "centos", "scientific", "fedora", "arch", "suse")

if platform?("redhat", "centos", "scientific", "fedora", "arch", "suse")
  yum_repository "sbt" do
    name "typesafe"
    url node[:scala_sbt][:repo_url][:redhat]
    action :add
  end
else
  remote_file "#{Chef::Config[:file_cache_path]}/sbt_repo.deb" do
    source node[:scala_sbt][:repo_url][:debian]
    action :create_if_missing
    backup false
  end

  package target_file do
    provider Chef::Provider::Package::Dpkg
    action :install
    source target_file
    notifies :run, "execute[apt-get update]", :immediately
  end
end

package "sbt"
