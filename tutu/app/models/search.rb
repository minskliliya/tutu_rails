class Search

  def self.find_train(start_station, end_station) 
    route_with_start = start_station.routes
    route_with_end = end_station.routes
    routes = route_with_start & route_with_end
    Train.where(route: routes)
  end  
end
