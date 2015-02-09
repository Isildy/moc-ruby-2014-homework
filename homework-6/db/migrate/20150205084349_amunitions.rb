class Amunitions < ActiveRecord::Migration
  def change
  	 create_table :amunitions do |t|
					t.string :title
					t.string :description
					t.belongs_to :gladiator, index: true
					t.integer :resource_id
      				t.string :resource_type
		end
  end
end
