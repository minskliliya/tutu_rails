class VagonsController < ApplicationController

  before_action :set_vagon, only: [:show, :edit, :update, :destroy]
  def index
    @vagons = Vagon.all
  end 

  def show
  end 

  def new 
    @vagon = Vagon.new
  end

  def create
    
    class_vagon = "#{vagon_params[:type]}" + "Vagon" 
    @vagon = class_vagon.classify.constantize.new(vagon_params)
        
    if @vagon.save
      redirect_to @vagon
    else
      render :new 
    end
  end 

  def edit
  end

  def update
    if @vagon.update(vagon_params)
      redirect_to @vagon
    else
      render :edit
    end
  end 

  def destroy
    @vagon.destroy
    redirect_to vagon_path
  end 
    
  private

  def set_vagon
    @vagon = Vagon.find(params[:id])
  end 

  def vagon_params
    params.require(:vagon).permit(:number, :type, :place_down, :place_up, :train_id, :side_top_seats, :side_bottom_seats, :seats)
  end 
end 