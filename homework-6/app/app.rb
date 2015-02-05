SOME_JSON = '{"gladiator":{"personal_data":{"name": "Staros", "gender":"male", "age":27},
							               "skills":["swordsman","spearman","bowmen"],
							               "amunition":
                                        {"weapon":
                                                  {"trident":{"damage":"7", "ability":"long-range strike"},
                                                  "net":{"damage":"1", "ability":"stack"},
                                                  "dagger":{"damage":"4"}},
							                           "armor":[{"head":"no","torso":"belt","limbs":"braser"}]
							}}}'	

require 'sinatra'
require 'sinatra/activerecord'


 
get '/' do
"Hello, World!"
x = Gladiator.new
x.name = "Sparos"
x.age = 27
x.email = "mele"
x.amunition = 
x.save

end 