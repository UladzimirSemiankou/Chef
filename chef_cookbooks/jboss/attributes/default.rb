default['jboss']['path'] = '/opt'
default['jboss']['home'] = "#{node['jboss']['path']}/wildfly-10.0.0.CR5"
default['jboss']['app_dir'] = "#{node['jboss']['home']}/standalone/deployments"
default['jboss']['user'] = 'jboss'
default['jboss']['group'] = 'jboss'
default['jboss']['url'] = "http://download.jboss.org/wildfly/10.0.0.CR5/wildfly-10.0.0.CR5.tar.gz"
default['jboss']['app_url'] = "http://www.cumulogic.com/download/Apps/testweb.zip"
