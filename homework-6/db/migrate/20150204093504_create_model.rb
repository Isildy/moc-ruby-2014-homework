class CreateModel < ActiveRecord::Migration
  def change
  	 create_table :gladiators do |t|
					t.string :name
					t.integer :age
					t.string :gender
			end
  end
end
