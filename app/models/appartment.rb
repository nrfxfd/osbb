class Appartment < ApplicationRecord

    has_many :residents, dependent: :destroy

end
