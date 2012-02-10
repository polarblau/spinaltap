module Rails
  module Generators
    class ModelGenerator < NamedBase

      class_option  :skip_vertebrae, 
                    :type    => :boolean, 
                    :default => false,
                    :desc    => "Don't generate a backbone model file?"

      def create_vertebrae_model
        invoke "vertebrae:model" unless options.skip_vertebrae?
      end

    end
  end
end