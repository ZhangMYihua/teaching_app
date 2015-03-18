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
	
	end


	def fits_within_open_slot
		unless timeslot.is_available?(start_time, end_time)
			errors.add(:timeslot, "A booking between #{start_time} and #{end_time} conflicts an existing booking")
		end
	end
end
