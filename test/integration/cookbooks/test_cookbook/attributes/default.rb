default['test_cookbook']['privateaddress'] = node['privateaddress']
Chef::Log.info("node['privateaddress'] in attribute file context: #{node['privateaddress']}")
