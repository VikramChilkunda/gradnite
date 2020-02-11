class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :show]
  before_action :admin_user, only: [:destroy, :index]
  
  def index
    @admins = User.where(admin: true)
    @admins.sort_by{:last_name}
    @users = User.where(admin: false)
    @users.sort_by{:last_name}
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.password = user_params[:idnum]
    @user.password_confirmation = user_params[:password]
    @user.last_name = @user.name.split(' ').second
    if @user.save
      log_in @user
      flash[:success] = "You have successfully registered for the GradNite App!"
      redirect_to @user
    else 
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    user = User.find(params[:id])
    Seat.find_by(user_id: user[:idnum]).update_attributes(user_id: nil)
    user.destroy
    flash[:success] = "User deleted"
    # redirect_to users_url
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :idnum, :mobilenum, :password,
                            :password_confirmation)
    end
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
