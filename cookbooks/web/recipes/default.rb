if node.role?("#{node['web_server']['nginx']}")
  include_recipe 'web_nginx'
elsif node.role?("#{node['web_server']['apache']}")
  include_recipe 'web_apache'
else
  puts "No such recipe for the role specified"
end
