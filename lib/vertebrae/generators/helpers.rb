module Vertebrae
  module Generators
    module Helpers
      
      def javascripts_path
        "app/assets/javascripts"
      end

      def app_name
      	Rails.application.class.name.split('::').first
      end

      def model_namespace
        model_name = file_name.singularize.camelize
        [app_name, "Models", name_space_fragments, model_name].flatten.join(".")
      end

    private
      
      # refactor, better way to get path? only exists for NamedBase!
      # http://api.rubyonrails.org/classes/Rails/Generators/NamedBase.html#method-i-regular_class_path
      def name_space_fragments
        if regular_class_path
          if regular_class_path.is_a? String
            regular_class_path.split('/').map(&:camelize)
          else
            regular_class_path.map(&:camelize)
          end
        else
          []
        end
      end
        
    end
  end
end
