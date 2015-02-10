require 'bundler/setup'
Bundler.require(:default)
require 'rubygems'

require 'sinatra/base'
require 'sinatra/contrib/all'
require 'sinatra/reloader'
require 'padrino-helpers'
require 'kaminari'

::Kaminari::Hooks.init
register Kaminari::Helpers::SinatraHelpers
register Padrino::Helpers


#set :environment, :production
enable :sessions
enable :logging
enable :protect_from_csrf

require "./model"

get "/" do
	redirect to("/gladiators")
end

get "/gladiators" do
  glads = Gladiator.all
  erb :index, locals:{glads: glads}, layout: "layout"
end

get "/gladiators/new" do
	glad = Gladiator.new
	erb :new, locals:{glad: glad}, layout: "layout"
end

get "/gladiators/:id/edit" do |id|
	glad = Gladiator.find(id)
	erb :edit , locals:{glad: glad}, layout: "layout"
end

post "/gladiators" do
	glad = Gladiator.new(params[:gladiator])
	if glad.save
	redirect to("/gladiators/#{glad.id}")
	else
	erb :new, locals: {glad: glad}, layout: "layout"
	end
end

put "/gladiators/:id" do |id|
	glad = Gladiator.find(id)
	glad.update_attributes(params[:gladiator])
	if glad.save
		redirect to("/gladiators/#{glad.id}")
	else
		erb :edit, locals: {glad: glad}, layout: "layout"
	end
end

delete "/gladiators/:id" do |id|
	glad = Gladiator.find(id)
	glad.destroy
	redirect to("/gladiators")
end

get '/gladiators/:id' do |id|

  glad = Gladiator.find(id.to_i)
  erb :show, locals:{glad: glad}, layout: "layout"

end 

get "/gladiators/:id/weapon/new" do |id|
	glad = Gladiator.find(id)
	amunition = Amunition.new
	erb :weapon, locals:{glad: glad, amunition: amunition}, layout: "layout"
end

post "/gladiators/:id/weapon/new" do |id|
	glad = Gladiator.find(id)
	amunition = Amunition.new(params[:gladiator])
	glad.amunitions << amunition
	if glad.save
	redirect to("/gladiators")
	else
	erb :weapon, locals: {glad: glad, amunition: amunition }, layout: "layout"
	end
end


delete "/gladiators/weapon/:id" do |id|
	amun = Amunition.find(id)
	amun.destroy
	redirect to("/gladiators")
end