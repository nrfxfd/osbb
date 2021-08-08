class WaterCounter < ApplicationRecord
  belongs_to :apartment#, foreign_key: true
end
