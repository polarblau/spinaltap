require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper'))

# is this an appropriate way of testing a module?
class Dummy
  include Vertebrae::Generators::Helpers
end

class GeneratorsHelpersTest < MiniTest::Unit::TestCase

  def setup
    @helpers = Dummy.new
  end

  # #javascripts_path

  def test_should_have_a_method_javascripts_path
    assert @helpers.respond_to?(:javascripts_path)
  end

  def test_javascripts_path_should_return_a_string
    assert_kind_of String, @helpers.javascripts_path
  end

  # #app_name

  def test_should_have_a_method_app_name
    assert @helpers.respond_to?(:app_name)
  end

  def test_should_return_the_rail_app_name
    Rails.application.class.stubs(:name).returns("TestApp::Application")
    assert_equal @helpers.app_name, "TestApp"
  end

  # #javascript_namespace_for

  def test_should_have_a_method_javascript_namespace_for
    assert @helpers.respond_to?(:javascript_namespace_for)
  end

  def test_should_return_a_method_javascript_namespace_for
    @helpers.stubs(:app_name).returns("FooBar")
    @helpers.stubs(:file_name).returns("bat")
    @helpers.stubs(:regular_class_path).returns(nil)
    assert_equal @helpers.javascript_namespace_for("Foo"), "FooBar.Foo.Bat"
  end

    def test_should_return_a_nested_method_model_namespace
    @helpers.stubs(:app_name).returns("FooBar")
    @helpers.stubs(:file_name).returns("bat")
    @helpers.stubs(:regular_class_path).returns("nested/folder/structure")
    assert_equal @helpers.javascript_namespace_for("Foo"), "FooBar.Foo.Nested.Folder.Structure.Bat"
  end

  # #model_namespace

  def test_should_have_a_method_model_namespace
    assert @helpers.respond_to?(:model_namespace)
  end

end