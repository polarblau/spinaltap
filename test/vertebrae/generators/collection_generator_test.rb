require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper'))
require File.expand_path(File.join(File.dirname(__FILE__), 'generators_test_helper'))

class CollectionGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Vertebrae::Generators::CollectionGenerator
  
  # should generate a collection

  def test_should_create_a_collection_file
    run_generator %w(users)
    assert_file "#{javascripts_path}/collections/users.js.coffee"
  end

  def test_should_create_a_collection_file_in_nested_folders
    run_generator %w(bar/baz/bat/users)
    assert_file "#{javascripts_path}/collections/bar/baz/bat/users.js.coffee"
  end

    def test_should_create_a_collection_file_and_convert_the_name
    run_generator %w(user)
    assert_file "#{javascripts_path}/collections/users.js.coffee"
  end

  # should generate a model

  # def test_should_create_a_model_file
  #    run_generator %w(foos)
  #    assert_file "#{javascripts_path}/models/foo.js.coffee"
  #  end
 
  #  def test_should_create_a_model_file_in_nested_folders
  #    run_generator %w(bar/baz/bat/foo)
  #    assert_file "#{javascripts_path}/models/bar/baz/bat/foo.js.coffee"
  #  end
 
  #  # # should contain model name
 
  #  def test_should_create_a_model_file_with_correct_name
  #    Rails.application.class.stubs(:name).returns("TestApp::Application")
  #    run_generator %w(foo)
  #    assert_file "#{javascripts_path}/models/foo.js.coffee", /class TestApp.Models.Foo/ 
  #  end
  
  #  def test_should_create_a_model_file_with_correctly_nested_name
  #    Rails.application.class.stubs(:name).returns("TestApp::Application")
  #    run_generator %w(bar/baz/bat/foo)
  #    assert_file "#{javascripts_path}/models/bar/baz/bat/foo.js.coffee", /class TestApp.Models.Bar.Baz.Bat.Foo/ 
 #  end
 
end