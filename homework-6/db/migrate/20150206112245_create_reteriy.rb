class CreateReteriy < ActiveRecord::Migration
  def change
  	create_table :retariys do |t|
					t.string :additional_equipment
	end
  end
end
