class BottomVagon < Vagon
  validates :side_bottom_seats, presence: true 

  def self.model_name
    Vagon.model_name
  end 
end  