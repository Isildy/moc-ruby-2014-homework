require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'rubygems'
require "sinatra"

require './model.rb'

get "/" do
	redirect to("/gladiators")
end

get "/gladiators" do
  glads = Gladiator.all
  erb :index , locals:{glads: glads}
end

get "/gladiators/new" do
	@glad = Gladiator.new
	@glad.name = "Sparos"
	@glad.age = 27
	@glad.gender = "mele"

	@weapon = Weapon.new

	@amunition = Amunition.new
	@amunition.title = "gladius"
	@amunition.description = "short sword"
	@amunition.resource = @weapon
	@glad.amunitions << @amunition
	@glad.saveredirect to("/gladiators")
	erb :new , locals:{glad: glad}
end

get "/gladiators/:id/edit" do |id|
	glad = Gladiator.find(id)
	erb :edit , locals:{glad: glad}
end

post "/gladiators" do
	glad = Gladiator.new(params[:gladiator])
	if glad.save
	redirect to("/services/#{glad.id}")
	else
	erb :new, locals: {glad: glad}
	end
end

put "/gladiators/:id" do |id|
	glad = Gladiator.find(id)
	glad.update_attributes(params[:gladiator])
	if glad.save
		redirect to("/gladiators/#{glad.id}")
	else
		erb :edit, locals: {glad: glad}
	end
end

delete "/gladiators/:id" do |id|
	glad = Gladiator.find(id)
	glad.destroy
	redirect to("/gladiators")
end



get '/weapon/:id' do |id|

  glad = Gladiator.find(id.to_i)
  erb :weapon , locals:{glad: glad}

end 
