require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper'))
 
describe Vertebrae::Generators::InstallGenerator do
  
  before do
    @generator = Vertebrae::Generators::InstallGenerator.new
  end

  describe "folder structure creation" do
    it "should create a models folder" do
      run_generator
    end
  end

end