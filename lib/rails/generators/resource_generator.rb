module Rails
  module Generators
    class ResourceGenerator < ModelGenerator

      class_option  :skip_spinaltap_view,
                    :type    => :boolean, 
                    :default => false,
                    :desc    => "Don't generate a backbone view and template?"

      def create_spinaltap_view
        invoke "spinaltap:view" unless options.skip_spinaltap_view?
      end

    end
  end
end