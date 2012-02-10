require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'rails'
require 'rails/generators/test_case'
require 'mocha'

# we load only main file which loads all others
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'vertebrae'))

# sample models etc
def fixtures_root
  File.join(File.dirname(__FILE__), 'fixtures')
end

# core files like application.js
def core_root
  File.join(File.dirname(__FILE__), 'core')
end

def destination_root
  File.expand_path(File.join(File.dirname(__FILE__), 'tmp'))
end

def load_core
  FileUtils.cp_r(core_root, destination_root)
end

def load_fixtures
  FileUtils.cp_r(fixtures_root, destination_root)
end

def reload_core
  cleanup_tmp_dir
  load_core
end

def cleanup_tmp_dir
  FileUtils.rm_rf(destination_root)
end