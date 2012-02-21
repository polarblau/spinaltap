guard 'minitest' do

  watch(%r|^test/unit/(.*)_test\.rb|)
  watch(%r|^lib/(.*)([^/]+)\.rb|){ |m| "test/unit/#{m[1]}#{m[2]}_test.rb" }

  watch(%r|test_helper\.rb|){ "test" }
end
