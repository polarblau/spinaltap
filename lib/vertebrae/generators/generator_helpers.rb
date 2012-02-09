module Vertebrae
  module Generators
    module GeneratorHelpers
      
      def javascripts_path
        "app/assets/javascripts"
      end

      def app_name
      	Rails.application.class.name.split('::').first
      end
   
    end
  end
end
