require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.verbose = false
  t.test_files = FileList['test/unit/**/*_test.rb', 'test/spec/**/*_spec.rb']
end

task :default => :test

begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end
