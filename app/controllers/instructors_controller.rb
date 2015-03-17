class InstructorsController < ApplicationController
  # def index
  #   @instructors = Instructor.all
  # end

  def index
  	if param = params[:subject_to_teach]
  		@instructors = Instructor.where(subject_to_teach: param)
  	else
	    @instructors = Instructor.all
	  end
  end


  def show
    @instructor = Instructor.find(params[:id])
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    @instructor.teacher = current_user
    if @instructor.save
      redirect_to instructors_url
    else
      render :new
    end
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    if @instructor.update_attributes(instructor_params)
      redirect_to instructor_path(@instructor)
    else
      render :edit
    end
  end

  def destroy
    
  end

private

  def instructor_params
    params.require(:instructor).permit(:country_of_origin, :first_language, :subject_to_teach, :education, :price_string, :about)
  end

end
