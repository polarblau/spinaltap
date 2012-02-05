require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper'))

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Vertebrae::Generators::InstallGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  #teardown :cleanup_destination_root

  def test_should_create_a_models_folder
    run_generator
  end
end