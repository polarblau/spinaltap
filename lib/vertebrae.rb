require "rails/generators"
require "vertebrae/version"
require "vertebrae/generators/generator_helpers"
require "vertebrae/generators/named_generator_helpers"
require "vertebrae/generators/install/install_generator"
require "vertebrae/generators/model/model_generator"

# should this go into it's own file?
require 'rails'
# http://guides.rubyonrails.org/asset_pipeline.html#adding-assets-to-your-gems
module Vertebrae
  class Engine < Rails::Engine
  end
end