require "ostruct"
require "yaml"

Secret = OpenStruct.new
if File.exist? (VagrantPlugins::Secret.secret_file)
  YAML.load_file(VagrantPlugins::Secret.secret_file).each do |k,v|
    Secret.send("#{k}=",v)
  end
end


