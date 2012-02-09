module Vertebrae
  module Generators
    module ModelGenerator# < Rails::Generators::NamedBase
      include Vertebrae::Generators::NamedGeneratorHelpers

      source_root File.expand_path("../templates", __FILE__)

      def create_model
        path = File.join(javascripts_path, "models", class_path, "#{file_name}.js.coffee")
        template "model.coffee", path
      end
    
    end
  end
end

module Rails::Generators
  class ModelGenerator < NamedBase
    include Vertebrae::Generators::ModelGenerator
  end
end