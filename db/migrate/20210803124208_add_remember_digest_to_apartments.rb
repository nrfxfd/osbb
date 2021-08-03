class AddRememberDigestToApartments < ActiveRecord::Migration[6.1]
  def change
    add_column :apartments, :remember_digest, :string
  end
end
