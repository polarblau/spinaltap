module Vertebrae
  module Generators
    module NamedGeneratorHelpers
      include Vertebrae::Generators::GeneratorHelpers

      def model_namespace
        javascript_namespace_for "Models"
      end

      def javascript_namespace_for(folder)
        [
          app_name,                        # name of the rails application
          folder.camelize,                 # folder passed as argument
          class_path.map(&:camelize),      # path extracted from file name
          file_name.singularize.camelize   # file name without path
        ].flatten.join(".")
      end
        
    end
  end
end
