class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(mobilenum: params[:session][:mobilenum])
    if user && user.authenticate(params[:session][:idnum])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
    # Create an error message.
      flash.now[:danger] = 'Invalid ID Number/password combination' 
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
