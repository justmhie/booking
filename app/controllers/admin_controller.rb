class AdminController < ApplicationController
  before_action :require_admin

  def index
    # Admin dashboard logic
    @total_users = User.count
    @total_hotels = Hotel.count
    @total_bookings = Booking.count
  end

  def manage_hotels
    @hotels = Hotel.all
  end

  def new_hotel
    @hotel = Hotel.new
  end

  def create_hotel
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      redirect_to manage_hotels_admin_path, notice: 'Hotel was successfully created.'
    else
      render :new_hotel
    end
  end

  def edit_hotel
    @hotel = Hotel.find(params[:id])
  end

  def update_hotel
    @hotel = Hotel.find(params[:id])

    if @hotel.update(hotel_params)
      redirect_to manage_hotels_admin_path, notice: 'Hotel was successfully updated.'
    else
      render :edit_hotel
    end
  end

  def destroy_hotel
    @hotel = Hotel.find(params[:id])
    @hotel.destroy

    redirect_to manage_hotels_admin_path, notice: 'Hotel was successfully deleted.'
  end

  def view_bookings
    @bookings = Booking.includes(:user, :hotel).all
  end

  def manage_users
    @users = User.all
  end

  private

  def require_admin
    redirect_to root_path, alert: 'Access denied.' unless current_user_is_admin?
  end

  def hotel_params
    params.require(:hotel).permit(:hotel_name, :description, :location, :contact_details, :amenities, :photo_gallery)
  end
end
