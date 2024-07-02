class UserRole < ApplicationRecord
  belongs_to :user
  validates :role, inclusion: { in: %w[guest customer admin] }
end
