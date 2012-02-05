require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper'))
require File.expand_path(File.join(File.dirname(__FILE__), 'generators_test_helper'))


class InstallGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Vertebrae::Generators::InstallGenerator

  # should have a description
  
  # should generate folder structure

	def test_should_create_a_models_folder
    run_generator
    assert_directory "#{javascripts_path}/models"
  end

  def test_should_create_a_collections_folder
    run_generator
    assert_directory "#{javascripts_path}/collections"
  end

  def test_should_create_a_views_folder
    run_generator
    assert_directory "#{javascripts_path}/views"
  end

  def test_should_create_a_templates_folder
    run_generator
    assert_directory "#{javascripts_path}/templates"
  end

  # should application file

  def test_should_create_application_file
    run_generator
    assert_file "#{javascripts_path}/app.js.coffee"
  end

end