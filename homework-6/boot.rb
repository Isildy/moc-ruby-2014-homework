require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'rubygems'
require "sinatra"
require './model.rb'


get '/' do

  glads = Gladiator.all
  erb :index , locals:{glads: glads}

end 


get '/weapon/:id' do |id|

  glad = Gladiator.find(id.to_i)
  erb :weapon , locals:{glad: glad}

end 
