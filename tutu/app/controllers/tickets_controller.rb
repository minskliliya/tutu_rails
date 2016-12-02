class TicketsController < ApplicationController
  before_action :set_train, only: [:create, :show, :new] 
  before_action :set_start_station, only: [:show, :create, :new]
  before_action :set_end_station, only: [:show, :create, :new]
  before_action :set_ticket, only: [:show]

  def show
  end

  def new
    @ticket = Ticket.new
  end
    
  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      redirect_to search_path
    end
  end

  def edit
  end

  def update
  end 

  def destroy
  end 
    
  private

    def set_train 
      @train = Train.find(params[:train_id])
    end

    def set_ticket 
      @ticket = Ticket.find(params[:id])
    end

    def set_start_station 
      @start_station = RailwayStation.find(params[:start_station_id])
    end

    def set_end_station 
      @end_station = RailwayStation.find(params[:end_station_id])
    end

    def ticket_params
      params.require(:vagon).permit(:number, :start_station_id, :end_station_id, :train_id, :passport_number, :passenger_name)
    end   
end  