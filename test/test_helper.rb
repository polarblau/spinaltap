require 'bundler/setup'
require 'minitest/autorun'

# why do we have to include this here?
require 'rails/generators'

Dir[File.dirname(__FILE__) + "/../lib/**/*.rb"].each {|f| require f }