class TicketsController < ApplicationController
  before_action :authenticate_user!, only: :create

  # before_action :set_train, only: [:create, :show, :new] 
  # before_action :set_start_station, only: [:show, :create, :new]
  # before_action :set_end_station, only: [:show, :create, :new]
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = current_user.admin? ? Ticket.all : current_user.tickets.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = current_user.tickets.new
  end
    
  def create
    @ticket = current_user.tickets.new(ticket_params)
    
    if @ticket.save
      redirect_to @ticket
    else
      redirect_to search_path
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit  
    end  
  end 

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end 

  def buy
    @ticket = Ticket.new(train_id: params[:train_id], start_station_id: params[:start_station_id], end_station_id: params[:end_station_id])
    render :new
  end  
    
  private

    # def set_train 
    #   @train = Train.find(params[:train_id])
    # end

    def set_ticket 
      @ticket = Ticket.find(params[:id])
    end

    # def set_start_station 
    #   @start_station = RailwayStation.find(params[:start_station_id])
    # end

    # def set_end_station 
    #   @end_station = RailwayStation.find(params[:end_station_id])
    # end

    def ticket_params
      params.require(:ticket).permit(:number, :start_station_id, :end_station_id, :train_id, :passport_number, :passenger_name)
    end   
end  