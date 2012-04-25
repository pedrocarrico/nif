require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rcov/rcovtask'
require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*.rb']
end

Rcov::RcovTask.new do |t|
  t.test_files = FileList['test/*test*.rb']
  t.verbose = true     # uncomment to see the executed command
  t.rcov_opts << '--exclude /gems/,/Library/,/usr/,spec,lib/tasks'
end

RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  # Put spec opts in a file named .rspec in root
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end
