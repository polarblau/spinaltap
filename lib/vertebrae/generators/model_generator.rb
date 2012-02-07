module Vertebrae
  module Generators
    class ModelGenerator < Rails::Generators::NamedBase
      include Vertebrae::Generators::Helpers

      source_root File.expand_path("../templates", __FILE__)

      def create_model
        # replace regular_class_path with a secure helper
        path = File.join(javascripts_path, "models", regular_class_path, "#{file_name}.js.coffee")
        template "model.coffee", path
      end
    
    end
  end
end