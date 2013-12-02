# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "elasticad/core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "elasticad_core"
  s.version     = Elasticad::Core::VERSION
  s.authors     = ["Abd ar-Rahman Hamidi"]
  s.email       = ["bakhtiyor.h@gmail.com"]
  s.homepage    = "https://github.com/elasticad/elasticad"
  s.summary     = "The bare bones necessary for Elasticad."
  s.description = "The bare bones necessary for Elasticad."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]
  
  s.add_dependency "rails", "~> 4.0.1"
  # s.add_dependency 'paperclip', '~> 3.5.2'
end
