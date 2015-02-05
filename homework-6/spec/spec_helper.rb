require 'rack/test'
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'factory_girl_rails'
require 'database_cleaner'

require File.expand_path '../../boot.rb', __FILE__
FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryGirl.find_definitions

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end


RSpec.configure do |config| 
 config.include RSpecMixin 
 config.include FactoryGirl::Syntax::Methods
 config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end
 config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

