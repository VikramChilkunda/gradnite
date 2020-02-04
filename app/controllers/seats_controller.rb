class SeatsController < ApplicationController
    before_action :logged_in_user, only: [:show]
    
    def show
        @seat = Seat.find(params[:id])
        
        
        if(@seat[:user_id] == nil)
            # Remove user's ownership of previous seat, if they are changing seats
            if(Seat.find_by(user_id: current_user[:idnum]) != nil)
                Seat.find_by(user_id: current_user[:idnum]).update_attribute(:user_id, nil)
            end
            
            # Tranfer user's seat ownership to the new seat
            @seat.update_attribute(:user_id, current_user[:idnum])
            
        end
        
        current_user.update_attribute(:seatnum, @seat[:seatnum])
        current_user.update_attribute(:busnum, @seat[:bus_id])
        
        redirect_to Bus.find_by(busnum: @seat.bus_id)
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
