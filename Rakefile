require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.verbose = false
  t.test_files = FileList['test/unit/**/*_test.rb', 'test/spec/**/*_spec.rb']
end

task :default => :test
