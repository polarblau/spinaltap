module GeneratorsTestHelper

  def self.included(base)
    path = destination_root
    base.class_eval do
      destination path
      setup :prepare_destination
    end
  end
  
  def javascripts_path
    "app/assets/javascripts"
  end

end
