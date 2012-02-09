guard 'minitest' do

  watch(%r|^test/unit/(.*)_test\.rb|)
  watch(%r|^lib/(.*)([^/]+)\.rb|){ |m| "test/#{m[1]}#{m[2]}_test.rb" }

  # watch(%r|^test/spec/(.*)_spec\.rb|)
  # watch(%r|^lib/(.*)([^/]+)\.rb|){ |m| "test/spec/#{m[1]}#{m[2]}_spec.rb" }

  watch(%r|test_helper\.rb|){ "test" }
end