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
    reset_session
    redirect_to(:instructors, notice: 'Logged out!')
  end




	# def new

 #  end

 #  def create
 #    @user = login(params[:email], params[:password])

 #    if @user
 #      session[:user_id] = @user.id
 #      redirect_to teachings_url, notice: "Logged in"
 #    else
 #      flash.now[:alert] = "Invalid email or password!"
 #      render :new
 #    end
 #  end

 #  def destroy
 #    logout
 #    redirect_to teachings_url, notice: "Logged out!"
 #  end
end
