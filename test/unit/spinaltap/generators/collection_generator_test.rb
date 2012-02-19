require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper'))

class CollectionGeneratorTest < Spinaltap::Generators::GeneratorTest
  tests Spinaltap::Generators::CollectionGenerator
  
  # should generate a collection

  def test_should_create_a_collection_file
    run_generator %w(users)
    assert_file "#{javascripts_path}/collections/users.js.coffee"
  end

  def test_should_create_a_collection_file_in_nested_folders
    run_generator %w(bar/baz/bat/users)
    assert_file "#{javascripts_path}/collections/bar/baz/bat/users.js.coffee"
  end

  def test_should_create_a_collection_file_and_convert_the_name
    run_generator %w(user)
    assert_file "#{javascripts_path}/collections/users.js.coffee"
  end

  # options

  def test_should_skip_model
    run_generator %w(user --skip-model)
    assert_no_file "#{javascripts_path}/models/user.js.coffee"
  end

  # should generate a model alongside

  def test_should_trigger_model_generator
    skip
    Spinaltap::Generators::ModelGenerator.expects(:start)
    run_generator %w(users)
  end

end