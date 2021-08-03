class Apartment < ApplicationRecord
  has_many :residents, dependent: :destroy
  accepts_nested_attributes_for :residents

  validates :apartment_number, presence: true, uniqueness: true

  has_secure_password
  #VALID_USER_REGEX = /\A[a-z]+\z/i
  #validates :user, presence: true, length: { minimum: 5, maximum: 21 },
  #         format: { with: VALID_USER_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4 }, allow_nil: true


  def Apartment.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
