require "pathname"
require "vagrant-secret/version"
require "vagrant-secret/plugin"

module VagrantPlugins
  module Secret

    def self.config_file
      called_root.join(".vagrant/secret.rb")
    end

    def self.called_root
      Pathname.pwd
    end

    def self.write_default_key
      content = <<-EOF
module Secret
  token = ""
end
EOF
      File.open(config_file,'w') do |f|
        f.puts content
      end
    end

  end
end
