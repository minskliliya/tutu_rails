class AddIndexsToVagons < ActiveRecord::Migration[5.0]
  def change
    add_index :vagons, [:id, :type]
  end
end
