class DeleteColumAmunitionGladiatorId < ActiveRecord::Migration
  def change
  	remove_column :amunitions, :gladiator_id
  end
end
