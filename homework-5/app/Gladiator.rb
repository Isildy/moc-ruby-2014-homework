

	RESPONSE = '{"gladiator":{"personal_data":{"name": "Staros", "gender":"male", "age":27},
							               "skills":["swordsman","spearman","bowmen"],
							               "amunition":
                                        {"weapon":
                                                  {"trident":{"damage":"7", "ability":"long-range strike"},
                                                  "net":{"damage":"1", "ability":"stack"},
                                                  "dagger":{"damage":"4"}},
							                           "armor":[{"head":"no","torso":"belt","limbs":"braser"}]
							}}}'	


response = JSON.parse(RESPONSE)

Gladiator = Struct.new(*response["gladiator"].keys.collect(&:to_sym)) do

	
def how_old?
 p "His age is #{personal_data["age"]}"
end

def self.print_how_old?

end

def spearman?
 p "Our gladiadiator #{skills.select{|x| x== "spearman" }[0]}! He will make a good retiarius"
end

def have_weapon?
 weapon = []
 amunition.each{|x| Hash[*x].each_pair{|key, value| if key == "weapon" then value.each_pair{|key, value| weapon<<key} end}}
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
      v.each_pair do |k, v|
       actions.each_pair do|action, way|
        define_singleton_method ("#{action}_vis_#{k}") do
         way.call(k, v)
        end
       end
      end
      end
     end
    end
   end
 end

end



