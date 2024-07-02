class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :room_type

  validates :check_in_date, :check_out_date, :status, presence: true
  validate :check_dates
  validate :no_double_booking

  private

  def check_dates
    if check_in_date >= check_out_date
      errors.add(:check_in_date, "must be before the check-out date")
    end
  end

  def no_double_booking
    if Booking.where(room_type_id: room_type_id)
               .where('(check_in_date BETWEEN ? AND ?) OR (check_out_date BETWEEN ? AND ?)',
                      check_in_date, check_out_date,
                      check_in_date, check_out_date)
               .exists?
      errors.add(:base, 'This room is already booked for the selected dates')
    end
  end
end
