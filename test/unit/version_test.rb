require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper'))

class VersionTest < MiniTest::Unit::TestCase

  def test_version_should_not_be_nil
    refute_nil Vertebrae::VERSION
  end

end