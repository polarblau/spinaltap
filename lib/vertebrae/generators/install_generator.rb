module Vertebrae
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Vertebrae::Generators::Helpers

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

      def create_app_base_files
        base_files.each do |directory|
          file = directory[0..-2]
          path = "#{javascripts_path}/#{directory}/base_#{file}.js.coffee"
          template "#{directory}/base_#{file}.coffee", path
        end  
      end

      def create_app_folder_structure
        (%w(templates config) | base_files).each do |directory|
          empty_directory "#{javascripts_path}/#{directory}"
        end
      end

      private

      def base_files
        files = %w(models)
        files << "views" if options.views?
        files << "collections" if options.collections?
        files
      end

    end
  end
end