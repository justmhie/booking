class User < ApplicationRecord
 
  has_secure_password
  has_many :bookings
  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :mobile_number, presence: true
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true
end
