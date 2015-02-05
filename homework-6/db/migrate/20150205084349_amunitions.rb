class Amunitions < ActiveRecord::Migration
  def change
  	 create_table :amunitions do |t|
					t.string :type
					t.string :title
					t.string :description
					t.belongs_to :gladiator, index: true
		end
  end
end
