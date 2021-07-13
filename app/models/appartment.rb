class Appartment < ApplicationRecord
    include Visible

    has_many :residents, dependent: :destroy

end
