#
# Cookbook Name:: couchpotato
# Recipe:: install_couchpotato
#
# Copyright 2016, PolyHat
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'yum-epel'

package 'git' do
  action :install
end

user node['couchpotato']['user'] do
  shell '/bin/bash'
  comment 'couchpotato User'
  home node['couchpotato']['directory']['install_dir']
  system true
end

node['couchpotato']['directory'].each do |_name, value|
  directory value do
    mode '755'
    owner node['couchpotato']['user']
    group node['couchpotato']['group']
    recursive true
  end
end

git node['couchpotato']['directory']['install_dir'] do
  repository node['couchpotato']['git_url']
  action :sync
end

execute 'checkout master' do
  cwd node['couchpotato']['directory']['install_dir']
  command 'git checkout master'
end

template 'couchpotato' do
  path '/etc/systemd/system/couchpotato.service'
  source 'couchpotato.service.erb'
  mode '775'
  owner 'root'
  group 'root'
  only_if { node['couchpotato']['release'] == 7 }
end

template 'couchpotato' do
  path node['couchpotato']['config_file']
  source 'settings.conf.erb'
  mode '775'
  owner node['couchpotato']['user']
  group node['couchpotato']['group']
end

execute 'update permissions' do
  command "chown -R couchpotato:couchpotato #{node['couchpotato']['directory']['install_dir']}"
end

service 'couchpotato' do
  action [:enable, :restart]
end
