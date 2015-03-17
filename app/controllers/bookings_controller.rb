class BookingsController < ApplicationController
before_action :load_user
  
  def new
    @booking = @user.bookings.new
  end

  def create
  	@booking = @user.bookings.new(booking_params)
    if @booking.save
      redirect_to teachings_path
    else
      render :new
    end
  end

  def index
  	@bookings = @user.bookings.all
  end

  def show
  end

  def delete
  end

private
  def booking_params
    params.require(:booking).permit(:description)
  end

  def load_user
    @user = current_user  
  end

end

