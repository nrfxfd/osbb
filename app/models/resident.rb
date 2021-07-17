class Resident < ApplicationRecord
  belongs_to :apartment
  validates_presence_of :apartment
end
