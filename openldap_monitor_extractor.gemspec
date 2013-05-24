# encoding: utf-8
lib = File.expand_path(File.join(%w{.. lib}, __FILE__))
$:.unshift(lib) unless $:.include?(lib)

require 'openldap_monitor_extractor/version'


Gem::Specification.new do |spec|

  spec.name          = "openldap_monitor_extractor"
  spec.version       = OpenldapMonitorExtractor::VERSION
  spec.authors       = ["Javier Juarez"]
  spec.email         = ["javier.juarez@gmail.com"]
  spec.description   = %q{OpenLDAP stats gem extractor}
  spec.summary       = %q{OpenLDAP Monitor database handler utility}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "net-ldap"
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
