require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'rubygems'
require "sinatra"

Dir[File.dirname(__FILE__) + '/app/*.rb'].each {|file| require file }