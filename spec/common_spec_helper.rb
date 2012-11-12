require 'pry'
require 'ffaker'
require 'rspec'

ENV['RAILS_ENV'] ||= 'test'
ENV['RACK_ENV']  ||= 'test'

RSpec.configure do |config|
  ### Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.mock_with :mocha
  require 'mocha_standalone'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[(File.join Dir.pwd, "spec/support/**/*.rb")].each {|f| require f}

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  # config.order = 'random'
end
