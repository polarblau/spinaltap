require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper'))
require File.expand_path(File.join(File.dirname(__FILE__), 'generators_test_helper'))

class TemplateGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Vertebrae::Generators::TemplateGenerator
  
  # should generate a template

  def test_should_create_a_template_file
    run_generator %w(bar/baz/bat/person)
    assert_file "#{assets_path}/templates/bar/baz/bat/people.jst.eco"
  end
 
end