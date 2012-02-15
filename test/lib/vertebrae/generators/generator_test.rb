module Vertebrae
  module Generators
    class GeneratorTest < Rails::Generators::TestCase
      include GeneratorsTestHelper

      def setup
        Rails.stubs(:root).returns(Pathname.new(core_root))
        Rails.application.class.stubs(:name).returns("TestApp::Application")
      end

    end
  end
end