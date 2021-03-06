# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "artworker/version"

Gem::Specification.new do |s|
  s.name        = "artworker"
  s.version     = Artworker::VERSION
  s.authors     = ["dataLAB"]
  s.email       = ["info@datalabprojects.com"]
  s.homepage    = "http://artworker.datalabprojects.com"
  s.summary     = %q{A ruby gem to help with common artist and artwork attributes.}
  s.description = %q{A ruby gem to help with common artist and artwork attributes.}
  
  s.rubyforge_project = "artworker"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  # specify development and runtime depencies here;
  s.add_dependency "railties", ">= 3.1.0"
  s.add_dependency "activerecord", ">= 3.1.0"
  s.add_dependency "activesupport", ">= 3.1.0"
    
  # specify any dependencies here;
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "sqlite3"

  # specify any runtime dependencies here;
  # s.add_runtime_dependency "rest-client"

end