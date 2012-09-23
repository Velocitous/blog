# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'common_spec_helper'
require 'fat_spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

RSpec.configure do |config|
  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
end