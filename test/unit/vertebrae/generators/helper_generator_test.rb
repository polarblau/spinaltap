require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper'))

class HelperGeneratorTest < Vertebrae::Generators::GeneratorTest
  tests Vertebrae::Generators::HelperGenerator
  
  # should generate a Helper

  def test_should_create_a_helper_file
    run_generator %w(foo)
    assert_file "#{javascripts_path}/helpers/foo.js.coffee"
  end

  def test_should_create_a_helper_file_in_nested_location
    run_generator %w(bar/baz/bat/person)
    assert_file "#{javascripts_path}/helpers/bar/baz/bat/person.js.coffee"
  end

  def test_should_convert_file_name
    run_generator %w(FooBar)
    assert_file "#{javascripts_path}/helpers/foo_bar.js.coffee"
  end
 
end