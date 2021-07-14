class Apartment < ApplicationRecord
  has_many :residents, dependent: :destroy
end
