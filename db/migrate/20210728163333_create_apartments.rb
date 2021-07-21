class CreateApartments < ActiveRecord::Migration[6.1]
  def change
    create_table :apartments do |t|
      t.integer :apartment_number
      t.decimal :apartment_area
      t.decimal :heating_counter
      t.decimal :water_counter
      t.decimal :electricity_counter
      t.decimal :arrears

      t.timestamps
    end
  end
end
