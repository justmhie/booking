class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :room_type
end
