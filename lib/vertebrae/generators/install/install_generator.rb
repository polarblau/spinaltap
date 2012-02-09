  module Vertebrae
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Vertebrae::Generators::GeneratorHelpers

      desc "Generate initial structure and files for your backbone app."

      source_root File.expand_path("../templates", __FILE__)

      # include views/collections folder and base file?
      class_option  :skip_views, 
                    :type    => :boolean, 
                    :default => false,
                    :desc    => "Exclude views folder and base file?"
      class_option  :skip_collections, 
                    :type    => :boolean, 
                    :default => false,
                    :desc    => "Exclude collections folder and base file?"

      def add_asset_mainfest
        insert_into_file "app/assets/javascripts/application.js", 
          :before => %r{//= require +['"]?jquery['"]\\n?} do
            "//= require 'vertebrae/vertebrae'"
        end
      end

      def create_app_initializer_file
        template "app.coffee", "#{javascripts_path}/app.js.coffee"
      end

      def create_app_router_file
        template "config/routes.coffee", "#{javascripts_path}/config/routes.js.coffee"
      end

      def create_app_folder_structure
        directories = %w(models templates)
        directories << 'views' unless options.skip_views?
        directories << 'collections' unless options.skip_collections?
        directories.each do |directory|
          empty_directory "#{javascripts_path}/#{directory}"
        end
      end

    end
  end
end