class Resident < ApplicationRecord
  include Visible
  belongs_to :appartment
end
