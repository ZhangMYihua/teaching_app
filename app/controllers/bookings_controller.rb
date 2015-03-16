class BookingsController < ApplicationController
before_action :load_user
before_action :load_timeslot
  
  def new
    @booking = @timeslot.bookings.new
  end

  def create
  	@booking = @timeslot.bookings.new(booking_params)
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
    @user = User.find(params[:student_id])
  end

  def load_timeslot
    @timeslot = Timeslot.find(params[:timeslot_id]) 
  end

end

