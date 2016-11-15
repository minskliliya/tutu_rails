class AddOrderToTrain < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :order, :boolean, default: false
  end
end
