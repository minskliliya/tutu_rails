class CreateVagons < ActiveRecord::Migration[5.0]
  def change
    create_table :vagons do |t|
      t.string :number
      t.string :type_vagon
      t.integer :place_down
      t.integer :place_up
     
      t.timestamps
    end
  end
end
