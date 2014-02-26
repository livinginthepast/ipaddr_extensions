include_recipe 'ipaddr_extensions'

Chef::Log.info("node['privateaddress'] in recipe compile context: #{node['privateaddress']}")

ruby_block 'check privateaddress in provider context' do
  block do
    Chef::Log.info("node['privateaddress'] in recipe provider context: #{node['privateaddress']}")
    unless node['privateaddress'] == '192.168.33.33'
      raise "ipaddr_extensions not loaded before providers run"
    end
  end
end

ruby_block 'check privateaddress in attribute context' do
  block do
    unless node['test_cookbook']['privateaddress'] == '192.168.33.33'
      raise "ipaddr_extensions not loaded before attributes compiled"
    end
  end
end
