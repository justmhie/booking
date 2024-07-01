class User < ApplicationRecord
  has_secure_password
  has_one :user_role
  has_many :bookings
  has_many :reviews

  validates :email, presence: true, uniqueness: true

  attribute :mobile_number, :string  

  ROLES = {
    customer: 'Customer',
    admin: 'Admin'
  }

  def role?(role)
    self.user_role.role == role.to_s
  end
end
