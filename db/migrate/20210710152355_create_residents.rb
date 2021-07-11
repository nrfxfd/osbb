class CreateResidents < ActiveRecord::Migration[6.1]
  def change
    create_table :residents do |t|
      t.integer :apprtmnt
      t.text :name
      t.text :lastname
      t.date :birthday
      t.text :telephone
      t.boolean :owner
      t.boolean :tenant

      t.timestamps
    end
  end
end
