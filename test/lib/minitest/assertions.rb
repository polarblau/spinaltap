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