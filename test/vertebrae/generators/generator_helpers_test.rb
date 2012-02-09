require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper'))

class GeneratorHelpersTest < MiniTest::Unit::TestCase

  def setup
    @helpers = Object.new
    @helpers.extend(Vertebrae::Generators::GeneratorHelpers)
  end

  # #javascripts_path

  def test_should_have_a_method_javascripts_path
    assert @helpers.respond_to?(:javascripts_path)
  end

  def test_javascripts_path_should_return_string
    assert_kind_of String, @helpers.javascripts_path
  end

  # #app_name

  def test_should_have_a_method_app_name
    assert @helpers.respond_to?(:app_name)
  end

  def test_app_name_should_return_string
    assert_kind_of String, @helpers.app_name
  end

  def test_app_name_should_return_rails_app_name
    Rails.application.class.stubs(:name).returns("TestApp::Application")
    assert_equal @helpers.app_name, "TestApp"
  end

end