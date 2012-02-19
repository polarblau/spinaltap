require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper'))

class InstallGeneratorTest < Spinaltap::Generators::GeneratorTest
  tests Spinaltap::Generators::InstallGenerator

  # should generate folder structure

  def setup
    super()
    reload_core
  end

  def teardown
    cleanup_tmp_dir
  end

  def test_should_create_a_models_folder
    run_generator
    assert_directory "#{javascripts_path}/models"
    assert_file "#{javascripts_path}/models/.gitkeep"
  end

  def test_should_create_a_collections_folder
    run_generator
    assert_directory "#{javascripts_path}/collections"
    assert_file "#{javascripts_path}/collections/.gitkeep"
  end

  def test_should_create_a_views_folder
    run_generator
    assert_directory "#{javascripts_path}/views"
    assert_file "#{javascripts_path}/views/.gitkeep"
  end

  def test_should_create_a_templates_folder
    run_generator
    assert_directory "#{assets_path}/templates"
    assert_file "#{assets_path}/templates/.gitkeep"
  end

  def test_should_create_a_config_folder
    run_generator
    assert_directory "#{javascripts_path}/config"
  end

  # should generate application file

  def test_should_create_application_file
    Rails.application.class.stubs(:name).returns("TestApp::Application")
    run_generator
    assert_file "#{javascripts_path}/test_app.js.coffee"
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

  def test_should_skip_templates_folder
    run_generator %w(--skip-templates)
    assert_no_directory "#{assets_path}/templates"
  end

    def test_should_skip_gitkeep_files
    run_generator %w(--skip-gitkeep)
    assert_no_file "#{javascripts_path}/models/.gitkeep"
    assert_no_file "#{javascripts_path}/collections/.gitkeep"
    assert_no_file "#{javascripts_path}/views/.gitkeep"
    assert_no_file "#{assets_path}/templates/.gitkeep"
  end

  # application file should contain app namespace

  def test_should_create_application_file_with_namespace
    run_generator
    assert_file "#{javascripts_path}/test_app.js.coffee", /TestApp =/
  end

  # should include require into application.js
  
  def test_should_include_requirement_into_manifest
    run_generator
    assert_file "#{javascripts_path}/application.js", /(\/\/= require spinaltap){1}/
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