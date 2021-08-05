class Resident < ApplicationRecord

  belongs_to :apartment
  validates_presence_of :apartment
  before_create :nonedit_fields
  before_update :nonedit_fields

  def nonedit_fields
    self.apartment_number = apartment.apartment_number
  end


end
