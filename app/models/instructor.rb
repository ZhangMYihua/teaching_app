class ActiveRecord::Base
	def joined_fields(*fields)
		fields.map{|f| send(f)}.join(" ").titleize
	end
end

class Instructor < ActiveRecord::Base
	has_many :bookings, through: :timeslots
	has_many :timeslots
	belongs_to :teacher, class_name: 'User', foreign_key: :teacher_id

	validates :teacher, presence: true
	monetize :price_cents
	
	mount_uploader :avatar, AvatarUploader
	mount_uploader :document, DocumentUploader

	
	def price_string
		price && price.format
	end

	def price_string=(val)
		if val =~ /(\d+(\.\d+)?)/
			self.price_cents = ($1.to_f * 100).to_i # convert to cents
		else
			raise "Couldn't turn this into a price: #{val.inspect}"
		end
	end
	
end