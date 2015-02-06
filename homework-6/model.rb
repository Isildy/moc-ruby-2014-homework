 ActiveRecord::Base.establish_connection(YAML.load_file(File.expand_path("./db/config.yml"))["test"])



class Gladiator<ActiveRecord::Base
    validates :name, :presence => true
    validates :age, :presence => true
    validates :gender, :presence => true
    validates :name, :length => { :minimum => 3 }

	belongs_to :weriors, :polymorphic => true, :dependent => :destroy
end

class Murmillon<ActiveRecord::Base
	has_many :amunitions, :as => :resource, :dependent => :destroy
	has_one :gladiator, :as => :weriors, :dependent => :destroy
end

class Retariy<ActiveRecord::Base
	has_many :amunitions, :as => :resource, :dependent => :destroy
	has_one :gladiator, :as => :weriors, :dependent => :destroy
end

class Bestiariy<ActiveRecord::Base
	has_many :amunitions, :as => :resource, :dependent => :destroy
	has_one :gladiator, :as => :weriors, :dependent => :destroy
end

class Amunition<ActiveRecord::Base
	validates :amunition_type, :presence => true
    validates :title, :presence => true
    validates :description, :presence => true

	 belongs_to :resource, :polymorphic => true
end

