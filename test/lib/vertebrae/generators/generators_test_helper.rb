module Vertebrae
  module Generators
    module GeneratorsTestHelper

      def self.included(base)
        path = destination_root
        base.class_eval do
          destination path
          setup :prepare_destination
        end
      end

      def assets_path
        "app/assets"
      end

      def javascripts_path
        "#{assets_path}/javascripts"
      end

    end
  end
end
