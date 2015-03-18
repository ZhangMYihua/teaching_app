class BookingsController < ApplicationController
  before_action :load_instructor, except: [:index]
  before_action :load_timeslot, except: [:index]
    
  def index
  	results = current_user.bookings

    if params[:start]
      time    = DateTime.parse params[:start]
      results = results.where("start_time >= ?", time)
    end

    if params[:end]
      time    = DateTime.parse params[:end]
      results = results.where("end_time < ?", time)
    end

    render json: results, each_serializer: BookingSerializer
  end

  def new
    @booking = @timeslot.bookings.new
  end

  def create
    @booking = @timeslot.bookings.new(booking_params)
    @booking.student = current_user
    if @booking.save
      redirect_to instructor_path(@instructor)
    else
      @bookings.errors
      render :new
    end
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

