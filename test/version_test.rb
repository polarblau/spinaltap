require File.expand_path(File.join(File.dirname(__FILE__), 'test_helper'))

class VersionTest < MiniTest::Unit::TestCase

  def test_that_kitty_can_eat
    refute_nil Vertebrae::VERSION
  end

end