begin
  require "vagrant"
rescue LoadError
  raise "The Vagrant pushover plugin must be run within Vagrant."
end

module VagrantPlugins
  module Secret

    class Plugin < Vagrant.plugin("2")
      name "Secret"
      description <<-DESC
      DESC

      command "secret-init" do
        require_relative "command"
        Command
      end

      config(:secret) do
        require_relative "config"
        Config
      end
    end
  end
end
