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

def fixtures_root
  File.expand_path(File.join(File.dirname(__FILE__), 'fixtures'))
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


# https://github.com/seattlerb/minitest/blob/master/lib/minitest/unit.rb
module MiniTest
  module Assertions

    def assert_model_equal(path, key, msg = nil)
      assert_fixture_equal path, key, :model, msg
    end

    def assert_collection_equal(path, key, msg = nil)
      assert_fixture_equal path, key, :collection, msg
    end

    def assert_view_equal(path, key, msg = nil)
      assert_fixture_equal path, key, :view,  msg
    end

    def assert_router_equal(path, key, msg = nil)
      assert_fixture_equal path, key, :route, msg
    end

    def assert_fixture_equal(path, fixture_path, fixture_type = :model, msg = nil)
      msg = message(msg) { "Expected #{mu_pp(path)} to match \"#{fixture_path}\" #{fixture_type} fixture, but it doesn't" }
      file_under_test_path = File.expand_path(path, destination_root)
      assert_file file_under_test_path
      fixture_file_path = File.expand_path("#{fixture_type}s/#{fixture_path}", fixtures_root)
      assert_file fixture_file_path
      assert File.read(file_under_test_path) == File.read(fixture_file_path), msg
    end

  end
end