#
# Cookbook Name:: scala-sbt
# Recipe:: default
#

include_recipe "apt"
include_recipe "java"

remote_file "#{Chef::Config[:file_cache_path]}/sbt_repo.deb" do
  source node[:scala_sbt][:repo_url]
  action :create_if_missing
  backup false
end

package "sbt_repo.deb" do
  provider Chef::Provider::Package::Dpkg
  action :install
  source "#{Chef::Config[:file_cache_path]}/sbt_repo.deb"
  notifies :run, "execute[apt-get update]", :immediately
end

package "sbt"
