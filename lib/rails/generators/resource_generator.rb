module Rails
  module Generators
    class ResourceGenerator < ModelGenerator

      class_option  :skip_vertebrae_view, 
                    :type    => :boolean, 
                    :default => false,
                    :desc    => "Don't generate a backbone view and template?"

      def create_vertebrae_view
        invoke "vertebrae:view" unless options.skip_vertebrae_view?
      end

    end
  end
end