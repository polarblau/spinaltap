module Vertebrae
  module Generators
    class TemplateGenerator < Rails::Generators::NamedBase
      include Vertebrae::Generators::NamedGeneratorHelpers

      desc "Generate Backbone template."

      source_root File.expand_path("../templates", __FILE__)
      
      def create_template
        path = File.join(assets_path, "templates", class_path, "#{file_name}.jst.eco")
        template "template.jst.eco", path
      end
    
    end
  end
end