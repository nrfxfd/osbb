class CreateResidents < ActiveRecord::Migration[6.1]
  def change
    create_table :residents do |t|
      t.integer :appartm
      t.text :lastname
      t.text :name
      t.text :surname
      t.text :telephone
      t.date :birthday
      t.boolean :owner
      t.boolean :tenant
      t.references :appartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
