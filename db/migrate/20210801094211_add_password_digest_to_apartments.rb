class AddPasswordDigestToApartments < ActiveRecord::Migration[6.1]
  def change
    add_column :apartments, :password_digest, :string
  end
end
