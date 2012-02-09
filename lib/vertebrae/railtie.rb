require 'rails'

module Vertebrae
  class Railtie < Rails::Railtie

    #config.app_generators.orm :vertebrae
    
  end
end

module Rails::Generators
  class ModelGenerator < Base
    hook_for :vertebrae
  end
end