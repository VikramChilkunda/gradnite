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
      flash[:success] = "Logged in"
      redirect_to @user
      # format.html { redirect_to @user, success: 'Logged in.' }
      # format.json { render :show, status: :created, location: @person }
    else 
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    user = User.find(params[:id])
    if(Seat.find_by(user_id: user.idnum))
      Seat.find_by(user_id: user.idnum).update_attribute(:user_id, nil)
    end
    User.find(params[:id]).destroy
    redirect_to users_url
    flash[:danger] = ("Student succesfully removed")
    # flash[:success] = t('.successfully_created')
    # format.html { redirect_to users_url, danger: 'Student succesfully removed' }
    # format.json { render :show, status: :created, location: @person }
  end
  
  def update
    seatAvailable = false
    @user = User.find(params[:id])
    
    if(params[:user][:busnum])
      seatNumOnBus = params[:user][:seatnum].to_i
      busnum = params[:user][:busnum].to_i
      seatNum = (busnum - 1) * 41 + seatNumOnBus
      newSeat = Seat.find(seatNum)
      
      if(!newSeat.user_id)
        seatAvailable = true
        previousSeatNumOnBus = @user.seatnum.to_i
        previousBusNum = @user.busnum.to_i
        previousSeatNum = (previousBusNum - 1) * 41 + previousSeatNumOnBus
        if previousSeat = Seat.find(previousSeatNum)
          previousSeat.update_attribute(:user_id, nil)
        end
        
        newSeat.update_attribute(:user_id, params[:user][:idnum])
      end
      
        # print("new: " + newSeat.user_id.to_s + "**********************************************************************")
    end 
    
    if seatAvailable && @user.update_attributes(user_params)
      flash[:success] = "Seat succesfully changed"
      redirect_to @user
      # format.html { redirect_to @user, success: 'Seat succesfully changed.' }
      # format.json { render :show, status: :created, location: @person }
    else
      if(!seatAvailable)
        flash[:success] = "Seat unavailable"
        redirect_to edit
        # format.html { redirect_to edit, danger: 'Seat unavailable.' }
        # format.json { head :no_content }
      end
      render 'edit'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :idnum, :mobilenum, :busnum, :seatnum)
    end
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_url
        # format.html { redirect_to login_url, danger: 'Please log in.' }
        # format.json { head :no_content }
      end
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless (current_user?(@user) or current_user.admin?)
    end
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
