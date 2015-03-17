class Timeslot < ActiveRecord::Base
	belongs_to :instructor
	has_many :bookings

  def timerange
    TimeRange.new(start_time, end_time)
  end

	def is_available?(wanted_timerange)
    self.bookings.all
		not bookings.any? do |booking|
			booking.overlap?(potential_booking)
		end
	end

end



