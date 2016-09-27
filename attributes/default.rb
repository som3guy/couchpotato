# General attributes
default['couchpotato']['directory']['install_dir'] = '/opt/couchpotato'
default['couchpotato']['user'] = 'couchpotato'
default['couchpotato']['group'] = 'couchpotato'

# Directories
default['couchpotato']['directory']['install_dir'] = '/opt/couchpotato'
default['couchpotato']['directory']['data_dir'] = '/var/couchpotato'
default['couchpotato']['directory']['config_dir'] = '/etc/couchpotato'
default['couchpotato']['directory']['pid_dir'] = '/var/run/couchpotato'
default['couchpotato']['directory']['lockfile_dir'] = '/var/run/couchpotato/subsys'

# Git Options
default['couchpotato']['git_url'] = 'https://github.com/CouchPotato/CouchPotatoServer.git'
default['couchpotato']['git_revision'] = 'master'

# Options
default['couchpotato']['config_file'] = "#{node['couchpotato']['directory']['config_dir']}/settings.conf"
default['couchpotato']['pid_file'] = "#{node['couchpotato']['directory']['pid_dir']}/couchpotato.pid"
