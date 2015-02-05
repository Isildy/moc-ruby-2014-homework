FactoryGirl.define do
  factory :gladiator do
    name 'Nanos'
    age '31'
    gender 'male'
  end
end


FactoryGirl.define do
   factory :amunition do
        amunition_type "arms"
        title "helmet"
        description "bronze closed helmet"
        association :gladiator
   end
end