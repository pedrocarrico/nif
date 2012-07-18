require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

task :default => [:test, :spec, :features]

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*.rb']
end

task :coverage do
  ENV['COVERAGE'] = 'on'
  FileUtils.rm_r 'coverage', :force => true
  Rake::Task["spec"].invoke
end

RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  # Put spec opts in a file named .rspec in root
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

