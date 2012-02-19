module Spinaltap
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Spinaltap::Generators::GeneratorHelpers

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
        if manifest_exists?
          insert_into_file manifest_path, :after => %r{//= require +['"]?(jquery|zepto)['"]?\n} do
            "//= require spinaltap\n"
          end
        else
          warn_no_manifest
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

      private

        def manifest_path
          "app/assets/javascripts/application.js"
        end

        def manifest_exists?
          @manifest_exists ||= File.exists?(Rails.root.join(manifest_path))
        end

        def warn_duplicated_file(file_name)
          say "Duplicated file: #{file_name}"
        end

        def warn_no_manifest
          say "Default manifest file doesn't exist. Remember to require 'spinaltap' in you custom manifest.'"
        end

    end
  end
end