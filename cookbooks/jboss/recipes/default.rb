#
# Cookbook Name:: jboss
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe "java_se"

user node['jboss']['user'] do
  home node['jboss']['home']
  system true
  shell '/bin/bash'
end

group node['jboss']['group'] do
  action :create
end

remote_file '/tmp/wildfly.tar.gz' do
  source node['jboss']['url']
  owner node['jboss']['user']
  group node['jboss']['group']
  mode '0755'
  action :create_if_missing
end

execute 'extract_jboss' do
  command 'tar -xzf /tmp/wildfly.tar.gz -C /opt'
  cwd "#{node['jboss']['path']}"
  not_if { File.exists?("/opt/wildfly-10.0.0.CR5/bin/standalone.sh") }
end

remote_file '/tmp/testweb.zip' do
  source node['jboss']['app_url']
  owner node['jboss']['user']
  group node['jboss']['group']
  mode '0755'
  action :create
end

execute 'extract_app' do
  command "unzip -o /tmp/testweb.zip -d #{node['jboss']['app_dir']}"
end

template '/etc/init.d/jboss' do
  source "jboss.erb"
  mode 0775
  owner 'root'
  group 'root'
  variables({
    'user' => node['jboss']['user'],
    'jboss_home' => node['jboss']['home']
  })
end

execute 'jboss_folder_chown' do
  command "chown -R #{node['jboss']['user']}:#{node['jboss']['group']} #{node['jboss']['home']}"
end

service 'jboss' do
  init_command "/etc/init.d/jboss"
  supports :restart => true, :status => false, :stop => true, :start => true
  action [ :enable, :start ]
end
