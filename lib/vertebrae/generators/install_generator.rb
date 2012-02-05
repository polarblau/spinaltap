module Vertebrae
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def create_dir_layout
        empty_directory "app/assets/javascripts/models"
        empty_directory "app/assets/javascripts/collections"
      end

    end
  end
end