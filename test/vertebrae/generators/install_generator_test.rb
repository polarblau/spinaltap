require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper'))
require File.expand_path(File.join(File.dirname(__FILE__), 'generators_test_helper'))

class InstallGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Vertebrae::Generators::InstallGenerator
  
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

  def test_should_create_a_config_folder
    run_generator
    assert_directory "#{javascripts_path}/config"
  end

  # should generate application file

  def test_should_create_application_file
    run_generator
    assert_file "#{javascripts_path}/app.js.coffee"
  end

  # should generate routes 

  def test_should_create_routes_file
    run_generator
    assert_file "#{javascripts_path}/config/routes.js.coffee"
  end

  # options

  def test_should_skip_views_folder
    run_generator %w(--skip-views)
    assert_no_directory "#{javascripts_path}/views"
  end

  def test_should_skip_collections_folder
    run_generator %w(--skip-collections)
    assert_no_directory "#{javascripts_path}/collections"
  end

  # application file should contain app namespace

  def test_should_create_application_file_with_namespace
    Rails.application.class.stubs(:name).returns("Foo::Application")
    run_generator
    assert_file "#{javascripts_path}/app.js.coffee", /Foo =/
  end

  # should include require into application.js
  
  def test_should_include_requirement_into_manifest
    run_generator
    assert_match "#{javascripts_path}/applications.js", /\/\/= require vertebrae/
  end

  # should include dependencies

  def test_should_include_backbone_dependency
    skip
    refute_nil RailsTestApp::Application.assets["backbone"]
  end

  def test_should_include_underscore_dependency
    skip
    refute_nil RailsTestApp::Application.assets["underscore"]
  end

end