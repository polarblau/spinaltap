module Rails
  module Generators
    class ModelGenerator < NamedBase

      class_option  :skip_vertebrae_model, 
                    :type    => :boolean, 
                    :default => false,
                    :desc    => "Don't generate a backbone collection and model?"

      def create_vertebrae_model
        invoke "vertebrae:collection" unless options.skip_vertebrae_model?
      end

    end
  end
end