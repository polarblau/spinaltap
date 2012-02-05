require File.expand_path(File.join(File.dirname(__FILE__), 'resource_helpers'))

module Vertebrae
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Vertebrae::Generators::ResourceHelpers

      source_root File.expand_path("../templates", __FILE__)

      def create_app_initializer_file
        template "app.coffee", "#{javascripts_path}/app.js.coffee"
      end

      def create_app_router_file
        template "routes.coffee", "#{javascripts_path}/config/app.js.coffee"
      end

      def create_app_base_files
        %w(models collections views).each do |directory|
          file = directory[0..-2]
          path = "#{javascripts_path}/#{directory}/base_#{file}.js.coffee"
          template "base_#{file}.coffee", path
        end  
      end

      def create_app_folder_structure
        %w(models collections views templates config).each do |directory|
          empty_directory "#{javascripts_path}/#{directory}"
        end
      end

    end
  end
end