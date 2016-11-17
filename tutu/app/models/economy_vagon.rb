class EconomyVagon < Vagon
 
  validates :side_top_seats, :side_bottom_seats, presence: true

  def self.model_name
    Vagon.model_name
  end  
end  
