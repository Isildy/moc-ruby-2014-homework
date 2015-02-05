class RenameColumType < ActiveRecord::Migration
  def change
  	rename_column :amunitions, :type, :aumnition_type
  end
end
