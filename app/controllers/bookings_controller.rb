class BookingsController < ApplicationController
before_action :load_timeslot
before_action :load_instructor
  
  def new
    @booking = @timeslot.bookings.new
  end

  def create
  	@booking = @timeslot.bookings.new(booking_params)
    if @booking.save
      redirect_to instructor_path(@instructor)
    else
      @bookings.errors
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
    params.require(:booking).permit(:start_time, :end_time)
  end

  def load_timeslot
    @timeslot = Timeslot.find(params[:timeslot_id])
  end

  def load_instructor
    @instructor = @timeslot.instructor
  end

end

