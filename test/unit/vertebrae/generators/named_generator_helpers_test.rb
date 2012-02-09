require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper'))
require File.expand_path(File.join(File.dirname(__FILE__), 'generators_test_helper'))

class NamedDummyGenerator < Rails::Generators::NamedBase
  include Vertebrae::Generators::NamedHelpers
end

class NamedDummyGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests NamedDummyGenerator

  # #javascript_namespace_for

  def test_should_have_a_method_javascript_namespace_for
    assert @generator.respond_to?(:javascript_namespace_for)
  end

  def test_should_return_a_method_javascript_namespace_for
    @generator.stubs(:app_name).returns("FooBar")
    @generator.stubs(:file_name).returns("bat")
    @generator.stubs(:regular_class_path).returns(nil)
    assert_equal @generator.javascript_namespace_for("Foo"), "FooBar.Foo.Bat"
  end

    def test_should_return_a_nested_method_model_namespace
    @generator.stubs(:app_name).returns("FooBar")
    @generator.stubs(:file_name).returns("bat")
    @generator.stubs(:regular_class_path).returns("nested/folder/structure")
    assert_equal @generator.javascript_namespace_for("Foo"), "FooBar.Foo.Nested.Folder.Structure.Bat"
  end

  # #model_namespace

  def test_should_have_a_method_model_namespace
    assert @generator.respond_to?(:model_namespace)
  end

end