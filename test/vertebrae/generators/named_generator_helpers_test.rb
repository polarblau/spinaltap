require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper'))

class NamedGeneratorHelpersTest < MiniTest::Unit::TestCase

  def setup
    @helpers = Object.new
    @helpers.extend(Vertebrae::Generators::NamedGeneratorHelpers)
  end

  # #javascript_namespace_for

  def test_should_have_a_method_javascript_namespace_for
    assert @helpers.respond_to?(:javascript_namespace_for)
  end

  # #model_namespace

  def test_should_have_a_method_model_namespace
    assert @helpers.respond_to?(:model_namespace)
  end

  # #collection_namespace

  def test_should_have_a_method_collection_namespace
    assert @helpers.respond_to?(:collection_namespace)
  end

  # #view_namespace

  def test_should_have_a_method_view_namespace
    assert @helpers.respond_to?(:view_namespace)
  end

  # #template_namespace

  def test_should_have_a_method_view_namespace
    assert @helpers.respond_to?(:view_namespace)
  end
  
end