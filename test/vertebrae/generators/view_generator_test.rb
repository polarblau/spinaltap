require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper'))
require File.expand_path(File.join(File.dirname(__FILE__), 'generators_test_helper'))

class ViewGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Vertebrae::Generators::ViewGenerator
  
  # should generate a view

  def test_should_create_a_view_file
    run_generator %w(foo)
    assert_file "#{javascripts_path}/views/foos_index.js.coffee"
  end

  def test_should_create_a_view_file_in_nested_folders
    run_generator %w(bar/baz/bat/person)
    assert_file "#{javascripts_path}/views/bar/baz/bat/people_index.js.coffee"
  end

  def test_should_create_a_model_file_and_convert_the_name
    run_generator %w(person)
    assert_file "#{javascripts_path}/views/people_index.js.coffee"
  end
 
end