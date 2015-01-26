require 'rack/test'
require 'rspec'
require 'capybara'
require 'capybara/rspec'


require File.expand_path '../../boot.rb', __FILE__

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end


RSpec.configure do |c| 
 c.include RSpecMixin 

end

