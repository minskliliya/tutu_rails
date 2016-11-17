class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :vagons

  validates :number, presence: true

  def count_vagon(type_vagon)
    Vagon.where(type: type_vagon).count  
  end

  def count_place(type_vagon,type_place)
    Vagon.where(type: type_vagon).sum(type_place)
  end  

  def order_vagon
    if order 
      vagons.ordered.reverse
    else
      vagons.ordered
    end
  end  
end
