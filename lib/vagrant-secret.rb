require "pathname"
require "vagrant-secret/version"
require "vagrant-secret/plugin"

module VagrantPlugins
  module Secret
  
    def self.secret_file
      called_root.join(".vagrant/secret.yaml")
    end

    def self.called_root
      Pathname.pwd
    end
    
    def self.generate_secret
      content = <<-EOF
# Write your secret settings here.
password: "*****"
EOF
      File.open(secret_file,'w') do |f|
        f.puts content
      end
    end

  end
end

# Load secret file and register it as class variable
require "vagrant-secret/loader"
