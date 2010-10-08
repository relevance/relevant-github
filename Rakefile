require 'rake'
require File.dirname(__FILE__) + "/lib/relevant/github.rb"

require 'rspec/core/rake_task'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.version = Relevant::Github::Version
    gemspec.name = "relevant-github"
    gemspec.summary = "Github commit widget for Relevant"
    gemspec.description = "Parses github activity feeds"
    gemspec.email = "opensource@thinkrelevance.com"
    gemspec.homepage = "http://github.com/relevance/relevant-github"
    gemspec.authors = ["Jared Pace", "Rob Sanheim"]
    gemspec.add_dependency "relevant-widget", "~> 0.0.7"
    gemspec.add_dependency "feedzirra"
    gemspec.add_development_dependency "rspec", "~> 2.0.0.rc"
    gemspec.files = Dir.glob('**/*.rb')
  end
  Jeweler::GemcutterTasks.new
  
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task :default => :spec

task :full_release => [:check_dependencies, :spec, :release]
