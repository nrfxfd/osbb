class AddAdminToApartments < ActiveRecord::Migration[6.1]
  def change
    add_column :apartments, :admin, :boolean
  end
end
