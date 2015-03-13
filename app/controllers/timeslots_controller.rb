class TimeslotsController < ApplicationController
	before_action :load_teaching
	
	def index
		@timeslots = @teaching.timeslots
		render json: @timeslots
	end

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

	def default_serializer_options
  	{root: false}
	end

	private	
	def timeslot_params
		params[:timeslot].permit(:time)
	end

	def load_teaching
		@teaching = Teaching.find(params[:teaching_id])
	end
end
