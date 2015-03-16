class SessionsController < ApplicationController

	def new
	  @user = User.new
	end

  def create
   if @user = login(params[:email], params[:password])
     redirect_back_or_to(:teachings, notice: 'Login successful')
   else
    flash.now[:alert] = 'Login failed'
    render action: 'new'
	 end
  end

  def destroy
 #    logout
    reset_session
    redirect_to(:teachings, notice: 'Logged out!')
  end

end
