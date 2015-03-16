class TimeslotsController < ApplicationController
	before_action :load_teaching

	def index
		results = @teaching.timeslots

		if params[:start]
			time 		= DateTime.parse params[:start]
			results = results.where("start_time >= ?", time)
		end

		if params[:end]
			time 		= DateTime.parse params[:end]
			results = results.where("end_time < ?", time)
		end

		render json: results, each_serializer: TimeslotSerializer
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
		params[:timeslot].permit(:start_time, :end_time)
	end

	def load_teaching
		@teaching = Teaching.find(params[:teaching_id])
	end
end
