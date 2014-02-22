# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-secret/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-secret"
  spec.version       = VagrantPlugin::Secret::VERSION
  spec.authors       = ["tcnksm"]
  spec.email         = ["nsd22843@gmail.com"]
  spec.summary       = %q{Write secret-key in Vagrantfile}
  spec.description   = %q{Enable to read external secret-key file}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
