# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'remover/version'

Gem::Specification.new do |spec|
  spec.name          = "github-team-remover"
  spec.version       = Remover::VERSION
  spec.authors       = ["Flatstack School"]
  spec.email         = ["fs-admin+school@flatstack.com"]
  spec.summary       = %q{Show empty teams on github}
  spec.description   = %q{Show empty teams on github. Teams without members or tems without repositories.}
  spec.homepage      = "http://github.com/FlatstackSchool/github-team-remover"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['github-team-remover']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'octokit', '~> 3.0'
  spec.add_dependency 'thor'

  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rspec', '~> 3.0.0.beta2'
end
