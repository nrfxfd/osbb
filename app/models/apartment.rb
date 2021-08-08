class Apartment < ApplicationRecord

  attr_accessor :remember_token
  has_many :residents, dependent: :destroy
  has_many :electricity_counters, dependent: :destroy
  has_many :water_counters, dependent: :destroy
  accepts_nested_attributes_for :residents
  validates :apartment_number, presence: true, uniqueness: true
  before_update :nonedit_fields

  has_secure_password
  #VALID_USER_REGEX = /\A[a-z]+\z/i
  #validates :user, presence: true, length: { minimum: 5, maximum: 21 },
  #         format: { with: VALID_USER_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4 }, allow_nil: true

  #Returns a digest of this line
  def Apartment.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #Returns a random token
  def Apartment.new_token
    SecureRandom.urlsafe_base64
  end

  #Remembers a apartment in the database for use in a permanent session.
  def remember
    self.remember_token = Apartment.new_token
    update_attribute(:remember_digest, Apartment.digest(remember_token))
  end

  #Returns true if the provided token matches the digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  #forgets the user
  def forget
    update_attribute(:remember_digest, nil)
  end

  #Check nonedit fields
  def nonedit_fields
    self.apartment_number = self.apartment_number_was
    self.apartment_area = self.apartment_area_was
  end

end

