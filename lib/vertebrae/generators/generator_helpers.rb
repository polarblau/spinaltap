module Vertebrae
  module Generators
    module GeneratorHelpers
      
      def assets_path
        "app/assets"
      end

      def javascripts_path
        "#{assets_path}/javascripts"
      end

      def router_namespace
        [app_name, "Routers"].join(".")
      end

      def app_name
      	Rails.application.class.name.split('::').first
      end
   
    end
  end
end
