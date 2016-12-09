class SearchesController < ApplicationController
  before_action :set_start_station, only: [:create] 
  before_action :set_end_station, only: [:create]

  def show
    @stations = RailwayStation.all
  end

  def new
  end  

  def create
    @trains = Search.find_train(@start_station, @end_station)    
    
    render :result 
  end  

  private

    def set_start_station
      @start_station = RailwayStation.find(params[:start_station])
    end

    def set_end_station
      @end_station = RailwayStation.find(params[:end_station])
    end  
end  