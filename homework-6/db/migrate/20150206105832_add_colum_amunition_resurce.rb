class AddColumAmunitionResurce < ActiveRecord::Migration
  def change
 
	add_column :amunitions, :resource_id, :decimal
    add_column :amunitions, :resource_type, :text
	
  end
end
