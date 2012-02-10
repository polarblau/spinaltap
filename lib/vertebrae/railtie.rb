require 'rails'

# http://stackoverflow.com/questions/9214714/rails-hooking-into-orm-generator
module Vertebrae
  class Railtie < Rails::Railtie
    # config.app_generators.orm :vertebrae    
  end
end

module Rails
  module Generators
    class ModelGenerator

      def create_vertebrae_model
        invoke "vertebrae:model" #unless options.skip_model?
      end

    end
  end
end