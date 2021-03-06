class BusesController < ApplicationController
    
    def index
        @buses = Bus.all
    end
    
    def show
        @bus = Bus.find(params[:id])
        @seats = @bus.seats.all.sort_by { |seat| seat.seatnum }
    end
    
    private
end
