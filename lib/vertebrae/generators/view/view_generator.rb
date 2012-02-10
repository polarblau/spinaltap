module Vertebrae
  module Generators
    class ViewGenerator < Rails::Generators::NamedBase
      include Vertebrae::Generators::NamedGeneratorHelpers

      desc "Generate Backbone view inheriting from Base.View ."

      source_root File.expand_path("../templates", __FILE__)

      class_option  :skip_template, 
                    :type    => :boolean, 
                    :default => false,
                    :desc    => "Don't generate a template file as well?"
      
      def create_view
        path = File.join(javascripts_path, "views", class_path, "#{file_name}.js.coffee")
        template "view.coffee", path
      end

      def create_template
        invoke "vertebrae:template" unless options.skip_template?
      end
    
    end
  end
end