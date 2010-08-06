# -*- ruby -*-
#
require 'rubygems'
require 'hoe'
begin
  require 'load_multi_rails_rake_tasks'
rescue LoadError
  $stderr.puts "Install the multi_rails gem to run tests against multiple versions of Rails"
end

require 'lib/facebooker/version'

NAME = 'facebooker-rails3'

begin
  gem 'jeweler'
  require 'jeweler'
  Jeweler::Tasks.new do |spec|
    spec.name         = NAME
    spec.version      = Facebooker::VERSION::STRING
    spec.summary      = "Facebooker for Rails 3"
    spec.description  = spec.summary
    spec.homepage     = "http://github.com/tarsolya/facebooker-rails3"
    spec.authors      = ["chad@chadfowler.com", "tarsolya@gmail.com"]
    spec.email        = "tarsolya@gmail.com"

    spec.files = FileList['[A-Z]*', File.join(*%w[{generators,lib,rails} ** *]).to_s]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler - or one of its dependencies - is not available. " <<
        "Install it with: sudo gem install jeweler -s http://gemcutter.org"
end

begin
  require 'rcov/rcovtask'

  namespace :test do
    namespace :coverage do
      desc "Delete aggregate coverage data."
      task(:clean) { rm_f "coverage.data" }
    end
    desc 'Aggregate code coverage for unit, functional and integration tests'
    Rcov::RcovTask.new(:coverage) do |t|
      t.libs << "test"
      t.test_files = FileList["test/**/*_test.rb"]
      t.output_dir = "coverage/"
      t.verbose = true
      t.rcov_opts = ['--exclude', 'test,/usr/lib/ruby,/Library/Ruby,/System/Library', '--sort', 'coverage']
    end
  end
rescue LoadError
  $stderr.puts "Install the rcov gem to enable test coverage analysis"
end
