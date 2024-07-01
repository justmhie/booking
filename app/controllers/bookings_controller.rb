class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  
  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking was sucessfully created.'
    else
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notic: 'Booking was successfully updated.'
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end
  
  private
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:check_in_data, :check_out_data, :room_type_id :hotel_id, :status).merge(user_id: current_user)
  end

   def require_login
    unless logged_in?
      flash[:alert] = 'Please log in to access this page'
      redirect_to login_url
    end
  end

  def logged_in?
    !!session[:user_id]
  end
end
