# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cap_elastics/version"

Gem::Specification.new do |s|
  s.name        = "cap-elastics"
  s.version     = CapElastics::VERSION
  s.authors     = ["Tiago Franco"]
  s.email       = ["gama.franco@gmail.com"]
  s.homepage    = "git@github.com:gamafranco/cap-elastics.git"
  s.summary     = %q{Cap extension for the Elastics gem.}

  s.rubyforge_project = "cap-elastics"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


  s.add_dependency "capistrano", "~> 2.0"
  s.add_dependency "elastics", "~> 1.0.10"
end
