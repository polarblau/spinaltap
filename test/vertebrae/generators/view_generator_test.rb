require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper'))
require File.expand_path(File.join(File.dirname(__FILE__), 'generators_test_helper'))

class ViewGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Vertebrae::Generators::ViewGenerator
  
  # should generate a view

  def test_should_create_a_view_file
    run_generator %w(foo)
    assert_file "#{javascripts_path}/views/foos.js.coffee"
  end

  def test_should_create_a_view_file_in_nested_folders
    run_generator %w(bar/baz/bat/person)
    assert_file "#{javascripts_path}/views/bar/baz/bat/people.js.coffee"
  end

  def test_should_create_a_view_file_and_convert_the_name
    run_generator %w(person)
    assert_file "#{javascripts_path}/views/people.js.coffee"
  end

  # should generate a template

  def test_should_create_a_template_file
    run_generator %w(person)
    assert_file "#{assets_path}/templates/people.jst.eco"
  end

  def test_should_create_a_template_file_in_nested_folders
    run_generator %w(bar/baz/bat/person)
    assert_file "#{assets_path}/templates/bar/baz/bat/people.jst.eco"
  end
 
  # # should contain model name

  def test_should_create_a_view_file_with_correct_name
    Rails.application.class.stubs(:name).returns("TestApp::Application")
    run_generator %w(person)
    assert_file "#{javascripts_path}/views/people.js.coffee", /class TestApp.Views.People/ 
  end

end