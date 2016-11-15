class Vagon < ActiveRecord::Base
  self.inheritance_column = :_type_disabled

  belongs_to :train

  validates :number, :side_top_seats, :side_bottom_seats, presence: true
  validates :number, uniqueness: { scope: :train_id}

  before_validation :number_vagon

  scope :economy, -> { where(type: 'EconomyVagon') }
  scope :coupe, -> { where(type: 'CoupeVagon') }
  scope :sitting, -> { where(type: 'SitingVagon') }
  scope :bottom, -> { where(type: 'BottomVagon') }
  
  scope :ordered, -> { order(:number)}
  
  def types 
    types = ['Economy', 'Coupe', 'Sitting', 'Bottom']
  end  

  private

  def number_vagon
    maximum_number = train.vagons.maximum(:number) || 0
    self.number = maximum_number + 1
  end  

end   