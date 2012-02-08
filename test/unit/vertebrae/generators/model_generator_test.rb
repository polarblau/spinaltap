require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper'))
require File.expand_path(File.join(File.dirname(__FILE__), 'generators_test_helper'))

class ModelGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Vertebrae::Generators::ModelGenerator
  
  # should generate a model

	def test_should_create_a_model_file
    run_generator %w(foo)
    assert_file "#{javascripts_path}/models/foo.js.coffee"
  end

  def test_should_create_a_model_file_in_nested_folders
    run_generator %w(bar/baz/bat/foo)
    assert_file "#{javascripts_path}/models/bar/baz/bat/foo.js.coffee"
  end

  # # should contain model name

  def test_should_create_a_model_file_with_correct_name
    Rails.application.class.stubs(:name).returns("TestApp::Application")
    run_generator %w(foo)
    assert_file "#{javascripts_path}/models/foo.js.coffee", /class TestApp.Models.Foo/ 
  end
 
  def test_should_create_a_model_file_with_correctly_nested_name
    Rails.application.class.stubs(:name).returns("TestApp::Application")
    run_generator %w(bar/baz/bat/foo)
    assert_file "#{javascripts_path}/models/bar/baz/bat/foo.js.coffee", /class TestApp.Models.Bar.Baz.Bat.Foo/ 
  end
 
end