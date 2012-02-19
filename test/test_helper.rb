require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'rails'
require 'rails/generators/test_case'
require 'mocha'

# we load only main file which loads all others
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'spinaltap'))

require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'spinaltap', 'paths_helper'))
require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'minitest', 'assertions'))
require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'spinaltap', 'generators', 'generators_test_helper'))
require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'spinaltap', 'generators', 'generator_test'))