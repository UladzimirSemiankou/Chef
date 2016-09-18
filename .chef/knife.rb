log_level                :info
log_location             STDOUT
knife[:editor] = 'vim'
home_dir = '/root/chef-repo/'
node_name                'admin'
client_key               '~/chef-repo/.chef/admin.pem'
validation_client_name   'feelgoodinc-validator'
validation_key           '~/chef-repo/.chef/feelgoodinc.pem'
chef_server_url          'https://vagrant-ubuntu-trusty-64/organizations/feelgoodinc'
syntax_check_cache_path  '~/chef-repo/.chef/syntax_check_cache'
cookbook_path [ '~/chef-repo/cookbooks' ]
ssl_verify_mode		 :verify_none
