module Vertebrae
  module Generators
    class ModelGenerator < Rails::Generators::NamedBase
      include Vertebrae::Generators::NamedGeneratorHelpers

      source_root File.expand_path("../templates", __FILE__)

      hook_for :orm
      
      def create_model
        path = File.join(javascripts_path, "models", class_path, "#{file_name}.js.coffee")
        template "model.coffee", path
      end
    
    end
  end
end