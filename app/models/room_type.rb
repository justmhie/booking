class RoomType < ApplicationRecord
  self.inheritance_column = :_type_disabled
  belongs_to :hotel
  has_many :bookings

  validates :type, :description, :capacity, :price_per_night, presence: true
end
