class AddWeriorsColumsToGladiator < ActiveRecord::Migration
  def change
  	add_column :gladiators, :weriors_id, :decimal
    add_column :gladiators, :weriors_type, :text
  end
end
