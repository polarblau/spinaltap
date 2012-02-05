module Vertebrae
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)

      def create_app_initializer_file
        template "app.coffee", "app/assets/javascripts/app.js.coffee"
      end

      def create_app_folder_structure
        %w(models collections views templates).each do |directory|
          empty_directory "app/assets/javascripts/#{directory}"
        end
      end

    end
  end
end