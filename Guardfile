guard 'minitest' do

  watch(%r|^test/unit/(.*)_test\.rb|)
  watch(%r|^lib/(.*)([^/]+)\.rb|){ |m| "test/#{m[1]}test_#{m[2]}.rb" }

  watch(%r|^test/spec/(.*)_spec\.rb|)
  # doesn't work, need extra rules for generators etc.
  watch(%r|^lib/(.*)([^/]+)\.rb|){ "spec" }

  watch(%r|test_helper\.rb|){ "test" }
end