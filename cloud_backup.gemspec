# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloud_backup/version'

Gem::Specification.new do |spec|
  spec.name          = "cloud_backup"
  spec.version       = CloudBackup::VERSION
  spec.authors       = ["Serdar Dogruyol"]
  spec.email         = ["dogruyolserdar@gmail.com"]
  spec.summary       = %q{Backup files and database dumps to Cloud.}
  spec.description   = %q{Backup files and database dumps to Cloud.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'dropbox-sdk'
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
end
