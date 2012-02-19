module Spinaltap
  module Generators
    module GeneratorHelpers
      
      def assets_path
        "app/assets"
      end

      def javascripts_path
        "#{assets_path}/javascripts"
      end

      def app_name
      	Rails.application.class.name.split('::').first
      end
   
    end
  end
end
