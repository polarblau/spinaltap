module Vertebrae
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Vertebrae::Generators::GeneratorHelpers

      desc "Generate initial structure and files for your backbone app."

      source_root File.expand_path("../templates", __FILE__)

      class_option  :skip_views, 
                    :type    => :boolean, 
                    :default => false,
                    :desc    => "Exclude views folder and base file?"
      class_option  :skip_collections, 
                    :type    => :boolean, 
                    :default => false,
                    :desc    => "Exclude collections folder and base file?"
      class_option  :skip_templates, 
                    :type    => :boolean, 
                    :default => false,
                    :desc    => "Exclude templates folder?"
      class_option  :skip_gitkeep, 
                    :type    => :boolean, 
                    :default => false,
                    :desc    => "Skip generation of .gitkeep files for empty folders?"                    

      def add_asset_manifest
        insert_into_file "app/assets/javascripts/application.js",
          :after => %r{//= require +['"]?jquery['"]?\n} do
            "//= require vertebrae\n"
        end
      end

      def create_app_initializer_file
        template "app.coffee", "#{javascripts_path}/#{app_name.underscore}.js.coffee"
      end

      def create_app_router_file
        template "config/routes.coffee", "#{javascripts_path}/config/routes.js.coffee"
      end

      def create_templates_directory
        unless options.skip_templates?
          empty_directory "#{assets_path}/templates"
          unless options.skip_gitkeep?
            create_file "#{assets_path}/templates/.gitkeep", :verbose => false
          end
        end
      end

      def create_app_folder_structure
        directories = %w(models)
        directories << 'views' unless options.skip_views?
        directories << 'collections' unless options.skip_collections?
        directories.each do |directory|
          empty_directory "#{javascripts_path}/#{directory}"
          unless options.skip_gitkeep?
            create_file "#{javascripts_path}/#{directory}/.gitkeep", :verbose => false
          end
        end
      end

    end
  end
end