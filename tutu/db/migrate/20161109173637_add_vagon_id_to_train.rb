class AddVagonIdToTrain < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :vagons, :train
  end
end
