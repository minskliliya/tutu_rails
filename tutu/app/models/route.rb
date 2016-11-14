class Route < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true 
  validate :station_count 

  before_validation :set_name
  before_create :station_number

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end  

  def station_count
    if railway_stations.size < 2
      errors.add(:base, "Route should contain at least 2 station")
    end  
  end  

  def station_number
    railway_stations_routes.each_with_index do | item, number |
      item.number = number
    end  
  end 
end
