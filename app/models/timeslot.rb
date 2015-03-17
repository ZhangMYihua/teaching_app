class Timeslot < ActiveRecord::Base
	belongs_to :teaching
	has_many :bookings

end
