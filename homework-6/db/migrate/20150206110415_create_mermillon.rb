class CreateMermillon < ActiveRecord::Migration
  def change
  	create_table :murmillons do |t|
					t.string :role
   end
  end
end
