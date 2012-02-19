module Spinaltap
  module Generators
    class CollectionGenerator < Rails::Generators::NamedBase
      include Spinaltap::Generators::NamedGeneratorHelpers

      desc "Generate Backbone collection inheriting from Base.Collection including model."

      source_root File.expand_path("../templates", __FILE__)
      
      class_option  :skip_model, 
                    :type    => :boolean, 
                    :default => false,
                    :desc    => "Don't generate a model file as well?"

      def create_collection
        path = File.join(javascripts_path, "collections", class_path, "#{plural_file_name}.js.coffee")
        template "collection.coffee", path
      end

      def create_model
        invoke "spinaltap:model" unless options.skip_model?
      end
        
    end
  end
end