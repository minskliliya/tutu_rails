class CreateVagons < ActiveRecord::Migration[5.0]
  def change
    create_table :vagons do |t|
      t.integer :number
      t.integer :place_down
      t.integer :place_up
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.string :type
      t.integer :seats_place
     
      t.timestamps
    end
  end
end
