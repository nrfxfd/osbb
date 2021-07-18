class Apartment < ApplicationRecord
  has_many :residents, dependent: :destroy
  accepts_nested_attributes_for :residents
end
