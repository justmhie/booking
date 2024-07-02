class HotelsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  def index
    @hotels = Hotel.all
  end

  def show
  end

  def new
    @hotel = Hotel.new
    @hotel.room_types.build 
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      redirect_to @hotel, notice: 'Hotel was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @hotel.update(hotel_params)
      redirect_to @hotel, notice: 'Hotel was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  @hotel = Hotel.find(params[:id])
  @hotel.destroy
  redirect_to hotels_path, notice: "Hotel deleted successfully"
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(
      :hotel_name, :description, :location, :contact_details, :amenities,
      photos: [],  # Permitting photos as an array
      room_types_attributes: [:id, :type, :description, :capacity, :price_per_night, :_destroy]
    )
  end
end
