class SeatsController < ApplicationController
    before_action :logged_in_user, only: [:show]
    
    def show
        @seat = Seat.find(params[:id])
        @seat.update_attribute(:user_id, current_user[:idnum])
        
        current_user.update_attribute(:seatnum, @seat[:seatnum])
        current_user.update_attribute(:busnum, @seat[:bus_id])
        
        redirect_to current_user
    end
    
    private
        def logged_in_user
          unless logged_in?
            store_location
            flash[:danger] = "Please log in."
            redirect_to login_url
          end
        end
end
