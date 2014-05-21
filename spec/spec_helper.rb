require 'coveralls'
Coveralls.wear!

# Set the rack environment to `test`
ENV["RACK_ENV"] = "test"

# Pull in all of the gems including those in the `test` group
require 'bundler'
Bundler.require :default, :test

# Require test libraries
require 'rspec'
require 'rack/test'

# Load the sinatra app
require_relative '../app'

RSpec.configure do |config|
  config.color_enabled = true
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
