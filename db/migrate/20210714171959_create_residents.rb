class CreateResidents < ActiveRecord::Migration[6.1]
  def change
    create_table :residents do |t|
      t.integer :apartment_number
      t.text :lastname
      t.text :name
      t.text :surname
      t.text :phone
      t.date :birthday
      t.boolean :owner
      t.boolean :tenant
      t.references :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
