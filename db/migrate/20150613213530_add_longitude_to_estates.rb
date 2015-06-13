class AddLongitudeToEstates < ActiveRecord::Migration
  def change
    add_column :estates, :longitude, :float
  end
end
