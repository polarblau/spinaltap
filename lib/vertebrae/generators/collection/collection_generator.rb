module Vertebrae
  module Generators
    class CollectionGenerator < Rails::Generators::NamedBase
      include Vertebrae::Generators::NamedGeneratorHelpers

      source_root File.expand_path("../templates", __FILE__)
      
      def create_collection
        path = File.join(javascripts_path, "Collections", class_path, "#{file_name.pluralize}.js.coffee")
        template "collection.coffee", path
      end

      def create_model
        invoke "vertebrae:model"
      end
        
    end
  end
end