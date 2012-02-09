require 'rails'

# http://stackoverflow.com/questions/9214714/rails-hooking-into-orm-generator
module Vertebrae
  class Railtie < Rails::Railtie
    # config.app_generators.orm :vertebrae    
  end
end