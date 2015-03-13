class Teaching < ActiveRecord::Base
	has_many :bookings, through: :timeslot
	has_many :timeslots
	belongs_to :teacher, class_name: 'User', foreign_key: :teacher_id

	validates :teacher, presence: true
end
