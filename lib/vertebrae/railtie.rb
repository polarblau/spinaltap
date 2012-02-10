require 'rails'

# http://stackoverflow.com/questions/9214714/rails-hooking-into-orm-generator
module Vertebrae
  class Railtie < Rails::Railtie
    # config.app_generators.orm :vertebrae    
  end
end

module Rails
  module Generators
    class ModelGenerator < NamedBase

      class_option  :skip_vertebrae, 
                    :type    => :boolean, 
                    :default => false,
                    :desc    => "Don't generate a model file as well?"

      def create_vertebrae_model
        invoke "vertebrae:model" unless options.skip_vertebrae?
      end

    end
  end
end