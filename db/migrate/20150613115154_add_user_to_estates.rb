class AddUserToEstates < ActiveRecord::Migration
  def change
    add_reference :estates, :user, index: true
    add_foreign_key :estates, :users
  end
end
