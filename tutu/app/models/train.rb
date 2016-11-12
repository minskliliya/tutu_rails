class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :vagons

  validates :number, presence: true

  def count_vagon(type_vagon)
    count_vagon = 0
    self.vagons.each do |vagon|
      if vagon.type_vagon == type_vagon
        count_vagon +=1
      end
    end
    count_vagon       
  end

  def count_place(type_vagon,type_place)
    count_place = 0
    self.vagons.each do |vagon|
      if vagon.type_vagon == type_vagon
        if type_place == "place_up" 
          count_place += vagon.place_up
        else
          count_place += vagon.place_down 
        end      
      end
    end
    count_place       
  end  
end
