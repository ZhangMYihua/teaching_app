class TimeslotsController < ApplicationController
	before_action :load_teaching
	
	def new
		@timeslot = @teaching.timeslots.new
	end

	def create
		@timeslot = @teaching.timeslots.new(timeslot_params)	
		if @timeslot.save
			redirect_to teaching_path(@teaching)
		else
			render :new
		end
	end



	private	
	def timeslot_params
		params[:timeslot].permit(:time)
	end

	def load_teaching
		@teaching = Teaching.find(params[:teaching_id])
	end
end
