class CreateEstates < ActiveRecord::Migration
  def change
    create_table :estates do |t|
      t.string :title
      t.decimal :price
      t.string :type
      t.text :description
      t.string :address

      t.timestamps null: false
    end
  end
end
