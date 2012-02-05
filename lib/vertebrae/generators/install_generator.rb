require 'active_support'

module Vertebrae
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include ActiveSupport

      source_root File.expand_path("../templates", __FILE__)

      def create_app_initializer_file
        template "app.coffee", "app/assets/javascripts/app.js.coffee"
      end

      def create_app_base_files
        %w(models collections views).each do |directory|
          file = directory[0..-2]
          path = "app/assets/javascripts/#{directory}/base_#{file}.js.coffee"
          template "base_#{file}.coffee", path
        end  
      end

      def create_app_folder_structure
        %w(models collections views templates config).each do |directory|
          empty_directory "app/assets/javascripts/#{directory}"
        end
      end

    end
  end
end