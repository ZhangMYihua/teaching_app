class Timeslot < ActiveRecord::Base
	belongs_to :instructor
	has_many :bookings

	AVAILABILITY_QUERY = <<-SQL
	(start_time >= ? AND start_time <= ?) AND
	(end_time >= ? AND end_time <= ?)
	SQL


	def is_available?(start_time, end_time)
		bookings.none? do |booking|
			range = ((start_time+1.second).to_i..(end_time-1.second).to_i)
			range.include?(booking.start_time.to_i) || range.include?(booking.end_time.to_i)
		end
	end

end
