class Timeslot < ActiveRecord::Base
	belongs_to :teaching
	has_one :booking
end
