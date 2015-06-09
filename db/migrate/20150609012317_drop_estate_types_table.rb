class DropEstateTypesTable < ActiveRecord::Migration
  def change
  	drop_table :estate_types
  end
end
