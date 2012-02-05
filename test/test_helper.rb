require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'

require 'rails/generators'
require 'rails/generators/test_case'

Dir[File.dirname(__FILE__) + "/../lib/**/*.rb"].each {|f| require f }