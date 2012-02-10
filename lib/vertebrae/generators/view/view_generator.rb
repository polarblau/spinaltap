module Vertebrae
  module Generators
    class ViewGenerator < Rails::Generators::NamedBase
      include Vertebrae::Generators::NamedGeneratorHelpers

      desc "Generate Backbone model inheriting from Base.Model ."

      source_root File.expand_path("../templates", __FILE__)
      
      def create_view
        path = File.join(javascripts_path, "views", class_path, "#{file_name.pluralize.underscore}_index.js.coffee")
        template "view.coffee", path
      end
    
    end
  end
end