require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper'))

class NamedGeneratorHelpersTest < MiniTest::Unit::TestCase

  def setup
    @helpers = Object.new
    @helpers.extend(Spinaltap::Generators::NamedGeneratorHelpers)
    @helpers.stubs(:app_name).returns("TestApp")
    @helpers.stubs(:file_name).returns("Foo")
    @helpers.stubs(:plural_file_name).returns("Foos")
    @helpers.stubs(:class_path).returns([])
  end

  # #javascript_namespace_for

  def test_should_have_a_method_javascript_namespace_for
    assert @helpers.respond_to?(:javascript_namespace_for)
  end

  # #model_namespace

  def test_should_have_a_method_model_namespace
    assert @helpers.respond_to?(:model_namespace)
  end

  def test_should_build_model_namespace
    assert_equal @helpers.model_namespace, "TestApp.Models.Foo"
  end

  def test_should_build_nested_model_namespace
    @helpers.stubs(:class_path).returns(["bar", "bat_baz"])
    assert_equal @helpers.model_namespace, "TestApp.Models.Bar.BatBaz.Foo"
  end

  # #collection_namespace

  def test_should_have_a_method_collection_namespace
    assert @helpers.respond_to?(:collection_namespace)
  end

  def test_should_build_collection_namespace
    assert_equal @helpers.collection_namespace, "TestApp.Collections.Foos"
  end

  def test_should_build_nested_collection_namespace
    @helpers.stubs(:class_path).returns(["bar", "bat_baz"])
    assert_equal @helpers.collection_namespace, "TestApp.Collections.Bar.BatBaz.Foos"
  end

  # #view_namespace

  def test_should_have_a_method_view_namespace
    assert @helpers.respond_to?(:view_namespace)
  end

  def test_should_build_view_namespace
    assert_equal @helpers.view_namespace, "TestApp.Views.Foo"
  end

  def test_should_build_nested_view_namespace
    @helpers.stubs(:class_path).returns(["bar", "bat_baz"])
    assert_equal @helpers.view_namespace, "TestApp.Views.Bar.BatBaz.Foo"
  end

  # #template_namespace

  def test_should_have_a_method_template_namespace
    assert @helpers.respond_to?(:template_namespace)
  end

  def test_should_build_template_namespace
    assert_equal @helpers.template_namespace, "foo"
  end

  def test_should_build_nested_template_namespace
    @helpers.stubs(:class_path).returns(["bar", "bat_baz"])
    assert_equal @helpers.template_namespace, "bar/bat_baz/foo"
  end
  
end