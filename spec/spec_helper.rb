require 'rspec'
require 'rspec/autorun'

$LOAD_PATH.unshift "../lib"
require "relevant/github"

RSpec.configure do |config|
  config.color_enabled = true
  config.mock_with :mocha

  config.formatter = :progress
  config.color_enabled = true
  config.filter_run :focused => true
  config.run_all_when_everything_filtered = true
  config.alias_example_to :fit, :focused => true
end
