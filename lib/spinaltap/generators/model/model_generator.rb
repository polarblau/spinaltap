module Spinaltap
  module Generators
    class ModelGenerator < Rails::Generators::NamedBase
      include Spinaltap::Generators::NamedGeneratorHelpers

      desc "Generate Backbone model inheriting from Base.Model ."

      source_root File.expand_path("../templates", __FILE__)
      
      def create_model
        path = File.join(javascripts_path, "models", class_path, "#{file_name.singularize}.js.coffee")
        template "model.coffee", path
      end
    
    end
  end
end