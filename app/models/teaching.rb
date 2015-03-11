class Teaching < ActiveRecord::Base
	has_many :bookings
	belongs_to :teacher, class_name: 'User'
end
