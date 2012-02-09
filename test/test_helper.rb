require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'rails'
require 'rails/generators/test_case'
require 'mocha'

# we load only main file which loads all others
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'vertebrae'))

def source_root
  File.join(File.dirname(__FILE__), 'fixtures')
end

def destination_root
  File.expand_path(File.join(File.dirname(__FILE__), 'tmp'))
end

def reload_fixtures
  cleanup_tmp_dir
  FileUtils.cp_r(source_root, destination_root)
end

def cleanup_tmp_dir
  FileUtils.rm_rf(destination_root)
end