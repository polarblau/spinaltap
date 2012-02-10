module Vertebrae
  module Generators
    class TemplateGenerator < Rails::Generators::NamedBase
      include Vertebrae::Generators::NamedGeneratorHelpers

      desc "Generate Backbone template."

      source_root File.expand_path("../templates", __FILE__)
      
      def create_template

      end
    
    end
  end
end