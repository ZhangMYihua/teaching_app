class TeachingsController < ApplicationController
  # before_action :load_user
  def index
  	if param = params[:subject_to_teach]
  		@teachings = Teaching.where(subject_to_teach: param)
  	else
	    @teachings = Teaching.all
	  end
  end

  def show
    @teaching = Teaching.find(params[:id])
  end

  def new
    @teaching = Teaching.new
  end

  def create
    @teaching = Teaching.new(teaching_params)
    @teaching.teacher = current_user
    if @teaching.save
      redirect_to teachings_url
    else
      render :new
    end
  end

  def edit
    @teaching = Teaching.find(params[:id])
  end

  def update
    @teaching = Teaching.find(params[:id])
    if @teaching.update_attributes(teaching_params)
      redirect_to teaching_path(@teaching)
    else
      render :edit
    end
  end

  def destroy
    
  end

  private

  def teaching_params
    params.require(:teaching).permit(:country_of_origin, :first_language, :subject_to_teach, :education, :price_string, :about)
  end


end
