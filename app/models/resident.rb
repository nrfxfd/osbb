class Resident < ApplicationRecord

  belongs_to :apartment
<<<<<<< HEAD

=======
  validates_presence_of :apartment
>>>>>>> develop
end
