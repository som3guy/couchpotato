#
# Cookbook Name:: couchpotato
# Recipe:: default
#
# Copyright 2016, PolyHat
#
# All rights reserved - Do Not Redistribute
#
# Attibutes
error = ''
if node['platform_version'].to_f >= 7.0
  node.default['couchpotato']['release'] = 7
elsif node['platform_version'].to_f >= 6.0
  node.default['couchpotato']['release'] = 6
else
  error = 'Please use a supported OS and version'
end
raise error unless error.empty?

# Recipes
if node['couchpotato']['release'] == 7
  include_recipe 'couchpotato::_install_python'
  include_recipe 'couchpotato::install_couchpotato'
elsif node['couchpotato']['release'] == 6
  include_recipe 'couchpotato::install_couchpotato'
end
