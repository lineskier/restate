class AddImageToEstates < ActiveRecord::Migration
  def change
    add_column :estates, :image, :string
  end
end
