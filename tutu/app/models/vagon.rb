class Vagon < ActiveRecord::Base
  belongs_to :train
  #belongs_to :train , class_name: 'Train', foreign_key: :train_id
end   