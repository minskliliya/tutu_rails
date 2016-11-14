class SittingVagon < Vagon
  validates :seats_place, presence: true 

  def self.model_name
    Vagon.model_name
  end 
end  