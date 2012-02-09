module Vertebrae
  module Generators
    module Helpers
      
      def javascripts_path
        "app/assets/javascripts"
      end

      def app_name
      	Rails.application.class.name.split('::').first
      end
   
    end
  end
end
