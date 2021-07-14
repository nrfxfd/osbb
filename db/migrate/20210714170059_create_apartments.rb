class CreateApartments < ActiveRecord::Migration[6.1]
  def change
    create_table :apartments do |t|
      t.integer :apartment_number
      t.decimal :apartment_area
      t.decimal :water_is_paid
      t.decimal :electricity_is_paid
      t.decimal :current_meters_water
      t.decimal :current_meter_electricity
      t.decimal :arrears

      t.timestamps
    end
  end
end
