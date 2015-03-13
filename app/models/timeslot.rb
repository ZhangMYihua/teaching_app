class Timeslot < ActiveRecord::Base
	belongs_to :teaching
	has_one :booking

	def start
		format_time start_time
	end
	
	def end
		format_time end_time
	end


	private
	def format_time(t)
		t.strftime("%Y-%m-%dT%H:%M:%S%z")
	end
end
