 ActiveRecord::Base.establish_connection(YAML.load_file(File.expand_path("./db/config.yml"))["development"])



class Gladiator<ActiveRecord::Base
    validates :name, :presence => true
    validates :age, :presence => true
    validates :gender, :presence => true
    validates :name, :length => { :minimum => 3 }
	has_many :amunitions
end

class Amunition<ActiveRecord::Base
	validates :amunition_type, :presence => true
    validates :title, :presence => true
    validates :description, :presence => true
	belongs_to :gladiator
end

