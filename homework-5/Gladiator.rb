require 'json'

	RESPONSE = '{"gladiator":{"personal_data":{"name": "Staros", "gender":"male", "age":27},
							"skills":["swordsman","spearman","bowmen"],
							"amunition":{"weapon":["trident","net","dagger"],
							"armor":[{"head":"no","torso":"belt","limbs":"braser"}]
							}}}'	


response = JSON.parse(RESPONSE)

Gladiator = Struct.new(*response["gladiator"].keys.collect(&:to_sym)) do

	def how_old?
		p "His age is #{personal_data["age"]}"
	end

	def spearman?
		p "Our gladiadiator #{skills.select{|x| x== "spearman" }[0]}! He will make a good retiarius"
	end

	def have_weapon?
		weapon = "no"
		amunition.each{|x| Hash[*x].each_pair{|key, value| if key == "weapon" then weapon=value end}}
		p "Glagiator #{personal_data["name"]} is carrying a #{weapon.join(", ")}"	
	end
	
	def generate_actions(data, actions)
		data.each do |k, v|
			if v.is_a?(Hash)
				v.each do |k, v|
					if k == "name"
						define_singleton_method ("greeting") do
							p "Going to death #{v}, salute you!"
						end
					elsif k == "weapon"
						v.each do |v|
							actions.each_pair do|action, way|
								define_singleton_method ("#{action}_vis_#{v}") do
								way.call(v)
								end
							end
							end
							end
						end
					end
				end
	end
end

trident_actions = {:attack => Proc.new{ |weapon| p "Strike #{weapon} in face"},
									:defance => Proc.new{ |weapon| p "Block #{weapon} weapon of the opponent"},
									:fint => Proc.new{ |weapon| p "Apply #{weapon} feint"}
									}

									
person = Gladiator.new(*response["gladiator"].values)
person.generate_actions(response["gladiator"], trident_actions)

print "\n"
p person.public_methods(false)
print "\n"
print "\n"
person.how_old?
person.spearman?
person.have_weapon?
print "\n"
p "======== Gladiator enters the arena ========"
print "\n"
person.greeting
print "\n"
p "======== Lets fight!!!!!!!!!!!!!!!! ========"
person.fint_vis_trident
person.defance_vis_net
person.attack_vis_dagger
