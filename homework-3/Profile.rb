require 'json'
module AutoProfile
	module GenMethods
		def gen_methods(methods)
			methods.each do |key, value| 
			define_method key do
			  p "#{key}:"
			if value.is_a?(Hash)
				value.each{|key, value| p "      #{key}: " 
					if value.is_a?(Hash)
				value.each{|key, value| p "    #{key} - #{value}"}						
					elsif	
				value.is_a?(Array)
				value.each{|key| 
					if key.is_a?(Hash)
					key.each{|key, value| p "        #{key} - #{value}"}
						else
				 			p "        #{key}"
						end}
					else
						p "           #{value}"
					end}
			elsif	
				value.is_a?(Array)
				value.each{|key| p "      #{key}"} 
			else
				p "#{value}"	
				end
			end
		  end
		end
end

	def self.included(base)
		base.extend(GenMethods)
	end
end



 module Validator

	def	adult?(data)
	    if data["personal_data"]["age"] < 15 
			p "To yang"
		elsif data["personal_data"]["age"] > 60
			p "To old"
		else
			p "Age is #{data["personal_data"]["age"]}, evesing Ok"
		end	
	end

	def twitter_account? (data)
		twiter_acc = "no"
		data["social_profiles"].each{|x| if x=~(/twitter\/\w+/) then twiter_acc = x end} 
		if 
			twiter_acc == "no"
			p "#{data["personal_data"]["name"]} has no twitter account"
		else
			p "Twiter account - #{twiter_acc}"
		end
	end

	def have_hobbies?(data)
		hobby = "no"
		data["additional_info"].each{|x| Hash[*x].each_pair{|key, value| if key == "hobby" then hobby=value end}}			
		if 
			hobby == "no"
			p "#{data["personal_data"]["name"]} has no hobby"
		else
			p "#{data["personal_data"]["name"]} likes #{hobby.join(", ")}"
		end
	end
end

	RESPONSE = '{"person":{"personal_data":{"name": "John Smith", "gender":"male", "age":56},
							"social_profiles":["http://facebook/John Smith","http://twitter/John_Smith","http://John_Smith.com"],
							"additional_info":{"hobby":["pubsurfing","drinking","hiking"], 
												"pets":[{"name":"Mittens","species":"Felis silvestris catus"}]
												}}}'	

response = JSON.parse(RESPONSE)
	if response.key?("person")

		person_object = Struct.new("Person", *response["person"].keys.collect(&:to_sym))

		person = person_object.new(*response["person"].values)
	end


class Print

include Validator

end

Print.class_eval do
	
	include AutoProfile
	gen_methods(response["person"])
end


print = Print.new
print.adult?(person)
print.twitter_account?(person)
print.have_hobbies?(person)
p Print.instance_methods(false)
print.personal_data
print.social_profiles
print.additional_info



