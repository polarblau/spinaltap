require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper'))

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Vertebrae::Generators::InstallGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  #teardown :cleanup_destination_root

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

end