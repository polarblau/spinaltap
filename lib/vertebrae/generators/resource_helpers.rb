module Vertebrae
  module Generators
    module ResourceHelpers
      
      def javascripts_path
        "app/assets/javascripts"
      end

      def app_name
      	Rails.application.class.name.split('::').first.underscore
      end
      
    end
  end
end
