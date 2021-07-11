class CreateAppartments < ActiveRecord::Migration[6.1]
  def change
    create_table :appartments do |t|
      t.integer :apprtmnt
      t.text :owner_name
      t.text :owner_lastname
      t.float :area_of_apprtmnt
      t.float :previus_water
      t.float :previus_electricity
      t.date :previus_date
      t.float :update_water
      t.float :update_electricity
      t.float :arrears

      t.timestamps
    end
  end
end
