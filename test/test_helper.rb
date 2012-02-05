require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'rails/generators/test_case'

# we load only main file which loads all others
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'vertebrae'))