require 'rails/generators'

module Rails
  module Generators
    class ModelGenerator < NamedBase

      class_option  :skip_spinaltap_collection,
                    :type    => :boolean, 
                    :default => false,
                    :desc    => "Don't generate a backbone collection and model?"

      def create_spinaltap_model
        invoke "spinaltap:collection" unless options.skip_spinaltap_collection?
      end

    end
  end
end