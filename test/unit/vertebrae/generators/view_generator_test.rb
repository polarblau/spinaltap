require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper'))


class ViewGeneratorTest < Vertebrae::Generators::GeneratorTest
  tests Vertebrae::Generators::ViewGenerator
  
  # should generate a view

  def test_should_create_a_view_file
    run_generator %w(foo)
    assert_file "#{javascripts_path}/views/foo.js.coffee"
  end

  def test_should_create_a_view_file_in_nested_folders
    run_generator %w(bar/baz/bat/person)
    assert_file "#{javascripts_path}/views/bar/baz/bat/person.js.coffee"
  end

  def test_should_convert_the_file_name
    run_generator %w(FooBar-Bat)
    assert_file "#{javascripts_path}/views/foo_bar_bat.js.coffee"
  end

  # should generate a template alongside

  def test_should_trigger_template_generator
    skip
  end
 
  # should contain view name

  def test_should_create_a_view_file_with_correct_name
    Rails.application.class.stubs(:name).returns("TestApp::Application")
    run_generator %w(person)
    assert_file "#{javascripts_path}/views/person.js.coffee", /class TestApp.Views.Person/ 
  end

end