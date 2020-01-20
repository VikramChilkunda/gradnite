class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      flash[:success] = "You have successfully registered for the GradNite App!"
    else 
      render 'new'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :idnum, :mobilenum, :password,
      :password_confirmation)
    end
end