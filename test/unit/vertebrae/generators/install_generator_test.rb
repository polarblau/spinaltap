require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper'))

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Vertebrae::Generators::InstallGenerator

  destination File.expand_path("../tmp", File.dirname(__FILE__))

  # should have a description
  
  # should generate folder structure

	def test_should_create_a_models_folder
    run_generator
    assert_directory "app/assets/javascripts/models"
  end

  def test_should_create_a_collections_folder
    run_generator
    assert_directory "app/assets/javascripts/collections"
  end

  def test_should_create_a_views_folder
    run_generator
    assert_directory "app/assets/javascripts/views"
  end

  def test_should_create_a_templates_folder
    run_generator
    assert_directory "app/assets/javascripts/templates"
  end

  # should application file

  def test_should_create_application_file
    run_generator
    assert_file "app/assets/javascripts/app.js.coffee"
  end

end