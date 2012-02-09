require 'rails'

module Vertebrae
  class Railtie < Rails::Railtie

    config.app_generators.orm :vertebrae
    
  end
end