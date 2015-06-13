class AddLatitudeToEstates < ActiveRecord::Migration
  def change
    add_column :estates, :latitude, :float
  end
end
