class Hotel < ApplicationRecord
  has_many :room_types
  accepts_nested_attributes_for :room_types, reject_if: :all_blank, allow_destroy: true
  has_many :bookings
  has_many_attached :photos


  validates :hotel_name, :description, :location, :contact_details, presence: true
end
