module Rails
  module Generators
    class ResourceGenerator < ModelGenerator

      def create_vertebrae_view
        invoke "vertebrae:view" unless options.skip_vertebrae?
      end

    end
  end
end