class AddPassagerToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :passenger_name, :string
    add_column :tickets, :passport_number, :string
    add_reference :tickets, :train, index: true, foreing_key: true 
  end
end
