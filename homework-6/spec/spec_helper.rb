require 'rack/test'
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'factory_girl_rails'

require File.expand_path '../../boot.rb', __FILE__
FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryGirl.find_definitions

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end


RSpec.configure do |c| 
 c.include RSpecMixin 
 c.include FactoryGirl::Syntax::Methods
end

