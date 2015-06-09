class CreateEstateTypes < ActiveRecord::Migration
  def change
    create_table :estate_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
