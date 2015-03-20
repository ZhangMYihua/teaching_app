class Booking < ActiveRecord::Base
	belongs_to :timeslot
	has_many :instructors, through: :timeslot
	belongs_to :student, class_name: 'User'


	# validate :fits_within_open_slot
	validate :consistent

	def timerange
		TimeRange.new(start_time, end_time)
	end

	private
	def consistent
		unless timeslot.is_available?(self)
			errors.add(:timeslot, "is unavailable for that booking")
		end
		
		if start_time > end_time
			errors.add(:start_time, "Cannot be greater than the end time")
		end
	end
end

