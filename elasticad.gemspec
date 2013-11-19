# encoding: UTF-8
version = File.read(File.expand_path('../ELASTICAD_VERSION',__FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'elasticad'
  s.version     = version
  s.summary     = 'Open source advertising classified engine built with Ruby on Rails and MongoDB.'
  s.description = 'ElasticAd is a complete open source advertising classified engine built with Ruby on Rails. It\'s a free to create Classifieds sites.'

  s.files        = Dir['README.md', 'lib/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  s.required_ruby_version     = '>= 2.0.0'
  s.required_rubygems_version = '>= 1.8.23'

  s.author       = 'Abd ar-Rahman Hamidi'
  s.email        = 'bakhtiyor.h@gmail.com'
  s.homepage     = 'https://github.com/elasticad/elasticad'
  s.license      = %q{MIT}

  s.add_dependency 'elasticad_core', version
end
