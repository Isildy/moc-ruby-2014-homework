SOME_JSON = '{"gladiator":{"personal_data":{"name": "Staros", "gender":"male", "age":27},
							               "skills":["swordsman","spearman","bowmen"],
							               "amunition":
                                        {"weapon":
                                                  {"trident":{"damage":"7", "ability":"long-range strike"},
                                                  "net":{"damage":"1", "ability":"stack"},
                                                  "dagger":{"damage":"4"}},
							                           "armor":[{"head":"no","torso":"belt","limbs":"braser"}]
							}}}'	


response = JSON.parse(SOME_JSON)

actions = {:attack => Proc.new{ |weapon, ability| p "Strike #{weapon} in face"},
                                 #ability.each_pair {|k,v| if k == "damage" then p "Gladiator struck the enemy #{v} points of damage" end }},
           :defance => Proc.new{ |weapon| p "Block #{weapon} weapon of the opponent"},
           :fint => Proc.new{ |weapon, ability|  p "Apply #{weapon} feint"}
                             # ability.each_pair {|k,v|  if k == "ability" then p "Gladiator try to #{v} enemy with #{weapon}"  end }}
          }

person = Gladiator.new(*response["gladiator"].values)
person.generate_actions(response["gladiator"],actions)


get '/' do
 
"
  ======== Gladiator enters the arena ========
  <b><p> #{person.greeting}</p></b>
 ======== Gladiator prapare to fight ========

 <p><a href='glad_info'>Gladiator info</a></p>
 <p><a href='fight'>Lets fight!</a></p>"


end

get '/glad_info' do

 "<b><p> #{person.how_old?}</p></b>
  <b><p> #{person.spearman?}</p></b>
  <b><p> #{person.have_weapon?}</p></b>
  <p>

  <p><a href='/'>Back to area</a></p
 "
end

get '/fight' do
  "
<b><p>======== Lets fight!!!!!!!!!!!!!!!! ========

 <p>#{person.attack_vis_trident}</p>
 <p>---------------------------------------------</p>
 <p>#{person.fint_vis_net}</p>
 <p>---------------------------------------------</p>
 <p>#{person.attack_vis_dagger}</p>
 <p> ---------------------------------------------</p>
 <p>#{person.defance_vis_trident}</p>
 <p> ---------------------------------------------</p></b>
 <p><a href='/'>Back to gritins</a></p>"
end
