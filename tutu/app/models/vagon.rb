class Vagon < ActiveRecord::Base
  self.inheritance_column = :_type_disabled

  belongs_to :train

  validates :number, :side_top_seats, :side_bottom_seats, presence: true

  scope :economy, -> { where(type: 'EconomyVagon') }
  scope :coupe, -> { where(type: 'CoupeVagon') }
  scope :sitting, -> { where(type: 'SitingVagon') }
  scope :bottom, -> { where(type: 'BottomVagon') }
  scope :ordered, -> { order(:number)}


  def types 
    types = ['economy', 'coupe', 'sitting', 'bottom']
  end  
end   