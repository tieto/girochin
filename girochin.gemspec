# -*- encoding: utf-8 -*-
require File.expand_path('../lib/girochin/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mihail Butorin", "Nikita Chernov"]
  gem.email         = ["misbut@gmail.com"]
  gem.description   = 'Analyzes request headers'
  gem.summary       = 'Analyzes request headers'
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "girochin"
  gem.require_paths = ["lib"]
  gem.version       = Girochin::VERSION

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'
end
