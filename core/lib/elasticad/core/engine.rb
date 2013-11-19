module Elasticad
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Elasticad
      engine_name :elasticad


      config.generators do |g|
        g.test_framework      :rspec,         fixture: false
        g.fixture_replacement :factory_girl,  dir: 'spec/factories'
        g.assets false
        g.helper false

        g.orm :mongoid
      end
    end
  end
end
