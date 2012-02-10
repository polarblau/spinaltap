module Vertebrae
  module Generators
    class HelperGenerator < Rails::Generators::NamedBase
      include Vertebrae::Generators::NamedGeneratorHelpers

      desc "Generate helper file."

      source_root File.expand_path("../templates", __FILE__)
      
      def create_helper
        path = File.join(javascripts_path, "helpers", class_path, "#{file_name}.js.coffee")
        template "helper.coffee", path
      end
    
    end
  end
end