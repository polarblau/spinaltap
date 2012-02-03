require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.verbose = false
  t.test_files = FileList['test/**/*_test.rb', 'spec/**/*_spec.rb']
end

task :default => :test
