class Booking < ActiveRecord::Base
	belongs_to :timeslot
	has_many :teachings, through: :timeslot
	belongs_to :student, class_name: 'User'
end
