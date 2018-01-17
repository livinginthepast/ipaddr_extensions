begin
  require 'ipaddr_extensions'
rescue LoadError
  if Gem.respond_to?(:install)
    begin
      Gem.install 'ipaddr_extensions'
    rescue LoadError
      # RubyGems >= 2.3.0, <= 2.5.0 raises a new LoadError even when successful
      raise if Gem.rubygems_version >= Gem::Version.new('2.5.0')
    end
  else
    require 'rubygems/commands/install_command'
    cmd = Gem::Commands::InstallCommand.new
    cmd.handle_options %w[--no-ri --no-rdoc ipaddr_extensions]

    begin
      cmd.execute
    rescue Gem::SystemExitException => _
    end
  end

  require 'ipaddr_extensions'
  require 'ohai'

  puts 'Reloading node attributes'
  ohai = ::Ohai::System.new
  ohai.all_plugins

  count = 0
  ObjectSpace.each_object(Chef::Node) do |node|
    next unless node.name
    node.automatic_attrs.merge! ohai.data
    count += 1
  end
  raise "Whoops! Expected to monkey patch only the current node, found #{count}" if count > 1
end
