# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-ncuportal/version"

Gem::Specification.new do |gem|
  gem.name        = "omniauth-ncuportal"
  gem.version     = OmniAuth::NCUPortal::VERSION
  gem.authors     = ["David Kuo"]
  gem.email       = ["me@davy.tw"]
  gem.homepage    = "https://github.com/NCUNOS/omniauth-ncuportal"
  gem.description = %q{OmniAuth gem.rategy for NCU Portal(3g) OAuth.}
  gem.summary     = gem.description
  gem.license     = "MIT"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '>= 1.1.1', '< 2.0'
end
