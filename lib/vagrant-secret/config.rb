require "net/https"

module VagrantPlugins
  module Secret
    class Config < Vagrant.plugin("2", :config)

      def initialize
        super
        @token = UNSET_VALUE
      end

      def read_key
        config_file = ::VagrantPlugins::Secret.config_file
        if not config_file.exist?
          ::VagrantPlugins::Secret.write_default_key
        end        
        require config_file
      end
      
      
      def validate(machine)
        errors = []        
        errors << "See more details, https://pushover.net/api" if errors.any?
        {secret: errors}
      end

      def finalize!
        @token     = nil                     if @token     == UNSET_VALUE
      end
    end
    
  end
end
        
