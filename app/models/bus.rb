class Bus < ApplicationRecord
    has_many :seats
    
    def get_users
        @bus = self
        @seats = @bus.seats.all
        
        str = []
        @seats.each do |seat|
           str.push(User.find_by(idnum: seat.user_id).name + " ")
        end
        
        str = str.sort_by{|s| s.split(' ').second}
        
        users = []
        str.each do |obj|
            obj = obj.rstrip
            users.push(User.find_by(name: obj))
        end
        
        
        
        return users
        
    end
end
