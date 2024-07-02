class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hotel

  validates :rating, inclusion: { in: 1..5 }
  validates :comment, :date, presence: true
end
