# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "houdini/version"

Gem::Specification.new do |s|
  s.name        = "houdini"
  s.version     = Houdini::VERSION
  s.authors     = ["Eric Campbell", "Duncan Mak"]
  s.email       = ["ericcampbell59@gmail.com", "duncanmak@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A Ruby DSL for building regular expressions}
  s.description = %q{A ruby DSL for building long complex regular expressions used frequently across large data extraction projects}

  s.rubyforge_project = "houdini"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
