class RemoveTypeFromEstates < ActiveRecord::Migration
  def change
    remove_column :estates, :type, :string
  end
end
