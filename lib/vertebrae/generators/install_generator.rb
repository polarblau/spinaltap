module Vertebrae
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def create_dir_layout
        %W{models collections views templates}.each do |dir|
          empty_directory "app/assets/javascripts/#{dir}"
        end
      end

    end
  end
end