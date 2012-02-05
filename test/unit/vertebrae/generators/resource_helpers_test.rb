require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper'))

# is this an appropriate way of testing a module?
class Dummy
  include Vertebrae::Generators::ResourceHelpers
end

class ResourceHelpersTest < MiniTest::Unit::TestCase

  def setup
    @helpers = Dummy.new
  end

  # #javascripts_path

  # going to far?
	def test_should_have_a_method_javascripts_path
    assert @helpers.respond_to?(:javascripts_path)
  end

  def test_javascripts_path_should_return_a_string
    assert_kind_of String, @helpers.javascripts_path
  end

end