class ActiveRecord::Base
	def joined_fields(*fields)
		fields.map{|f| send(f)}.join(" ")
	end
end

class Teaching < ActiveRecord::Base
	has_many :bookings, through: :timeslot
	has_many :timeslots
	belongs_to :teacher, class_name: 'User', foreign_key: :teacher_id

	validates :teacher, presence: true

	monetize :price_cents
end



# def price_dollars
#   price_cents.to_d/100 if price_cents
# end

# def price_in_dollars=(dollars)
#   self.price_in_cents = dollars.to_d*100 if dollars.present?
# end