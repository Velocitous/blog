
require 'mongo'
require 'mongoid'

ENV['MONGOID_ENV'] ||= 'test'

config_file = File.join(Dir.pwd, 'config/mongoid.yml')
if File.exists? config_file
  begin
    ::Mongoid.load! config_file
  rescue ::Mongoid::Errors::NoSessionsConfig  => e
    handle_configuration_error e
  rescue ::Mongoid::Errors::NoDefaultSession  => e
    handle_configuration_error e
  rescue ::Mongoid::Errors::NoSessionDatabase => e
    handle_configuration_error e
  rescue ::Mongoid::Errors::NoSessionHosts    => e
    handle_configuration_error e
  end

end

RSpec.configure do |config|
  require 'database_cleaner'
  config.before :suite do
    DatabaseCleaner[:mongoid].strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.clean
    ::Mongoid::IdentityMap.clear
  end
end