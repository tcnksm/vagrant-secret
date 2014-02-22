require "net/https"

module VagrantPlugins
  module Secret
    class Command < Vagrant.plugin("2", :command)

      def self.synopsis
        "generates "
      end
      
      def execute
        config_file = ::VagrantPlugins::Secret.config_file
        if config_file.exist?
          @env.ui.info("Secret key file (.vagrant/secret.rb) is already exist.")
        else
          ::VagrantPlugins::Secret.write_default_key
          @env.ui.info("Generated secret key file (.vagrant/secret.rb).")
        end
      end  
    end          
  end
end        
