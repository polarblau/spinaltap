guard 'minitest' do

  watch(%r|^test/unit/(.*)_test\.rb|)
  watch(%r|^lib/(.*)([^/]+)\.rb|){ |m| "test/#{m[1]}#{m[2]}_test.rb" }

  watch(%r|test_helper\.rb|){ "test" }
end

guard 'jasmine-headless-webkit' do
  watch(%r{^app/assets/javascripts/(.*)\..*}) { |m| newest_js_file("spec/javascripts/#{m[1]}_spec") }
end