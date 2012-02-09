  module Vertebrae
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Vertebrae::Generators::GeneratorHelpers

      desc "Generate initial structure and files for your backbone app."

      source_root File.expand_path("../templates", __FILE__)

      # include views/collections folder and base file?
      class_option  :views, 
                    :type    => :boolean, 
                    :default => true,
                    :desc    => "Include views folder and base file?"
      class_option  :collections, 
                    :type    => :boolean, 
                    :default => true,
                    :desc    => "Include collections folder and base file?"

      def create_app_initializer_file
        template "app.coffee", "#{javascripts_path}/app.js.coffee"
      end

      def create_app_router_file
        template "config/routes.coffee", "#{javascripts_path}/config/routes.js.coffee"
      end

      def create_app_folder_structure
        directories = %w(models templates)
        directories << 'views' if options.views?
        directories << 'collections' if options.collections?
        directories.each do |directory|
          empty_directory "#{javascripts_path}/#{directory}"
        end
      end

    end
  end
end