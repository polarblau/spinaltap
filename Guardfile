guard 'minitest' do

  watch(%r|^test/unit/(.*)_test\.rb|)
  watch(%r|^lib/(.*)([^/]+)\.rb|){ |m| "test/unit/#{m[1]}#{m[2]}_test.rb" }

  watch(%r|test_helper\.rb|){ "test" }
end

guard 'jasmine-headless-webkit' do
  watch(%r{^test/resources/test_app/assets/javascripts/(.*)\..*}) do |m|
  	newest_js_file("test/jasmine/spec/#{m[1]}_spec")
  end
end