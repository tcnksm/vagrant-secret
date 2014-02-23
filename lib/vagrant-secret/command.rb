require "net/https"

module VagrantPlugins
  module Secret
    class Command < Vagrant.plugin("2", :command)

      def self.synopsis
        "generates secret file"
      end
      
      def execute
        secret_file = ::VagrantPlugins::Secret.secret_file
        if secret_file.exist?
          @env.ui.info("[vagrant-secret] Secret key file (.vagrant/secret.rb) is already exist.")
        else
          ::VagrantPlugins::Secret.generate_secret
          @env.ui.info("[vagrant-secret] Generated secret key file (.vagrant/secret.rb).")
        end
      end  
    end          
  end
end        
