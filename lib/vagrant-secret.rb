require "pathname"
require "vagrant-secret/version"
require "vagrant-secret/plugin"

module VagrantPlugins
  module Secret

    def self.secret_file
      called_root.join(".vagrant/secret.rb")
    end

    def self.called_root
      Pathname.pwd
    end

    def self.load_secret
      begin
        require VagrantPlugins::Secret.secret_file
      rescue LoadError
        STDERR.puts "Secret file is not exist. To enable it run `vagrant secret-init`"
      end
    end

    def self.generate_secret
      content = <<-EOF
module Secret
  password = "****"
end
EOF
      File.open(secret_file,'w') do |f|
        f.puts content
      end
    end

  end
end

# Load secret file and enable it.
VagrantPlugins::Secret.load_secret
