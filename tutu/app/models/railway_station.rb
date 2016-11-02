class RailwayStation < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, class_name: 'Train', foreign_key: :current_station_id

  validates :title, presence: true  
end
