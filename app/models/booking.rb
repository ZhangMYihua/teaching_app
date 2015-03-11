class Booking < ActiveRecord::Base
	belongs_to :teaching
	belongs_to :student, class_name: 'User'
end
