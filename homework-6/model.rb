ActiveRecord::Base.establish_connection(YAML.load_file(File.expand_path("./db/config.yml"))["development"])


class Gladiator<ActiveRecord::Base
    has_many :amunitions

    validates :name, :presence => true
    validates :age, :presence => true
    validates :gender, :presence => true
    validates :name, :length => { :minimum => 3 }
end

class Arms<ActiveRecord::Base
	has_many :amunitions, :as => :resource, :dependent => :destroy
end

class Weapon<ActiveRecord::Base
	has_many :amunitions, :as => :resource, :dependent => :destroy
end


class Amunition<ActiveRecord::Base
	
	belongs_to  :resource, :polymorphic => true
	belongs_to  :gladiator


    validates :title, :presence => true
    validates :description, :presence => true
	# named_scope :weapons, :resource => { :resource_type => "Weapons" }
	# named_scope :arms, :resource => { :resource_type => "Arms" }
end

