class CreateBestiariy < ActiveRecord::Migration
   def change
  	create_table :bestiariys do |t|
					t.string :additional_equipment
   end
  end
end
