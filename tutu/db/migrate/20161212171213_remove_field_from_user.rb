class RemoveFieldFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :last_sing_in_ip, :string
    remove_column :users, :sign_in_count, :integer
    remove_column :users, :current_sign_in_at, :datetime
    remove_column :users, :last_sign_in_at, :datetime
    remove_column :users, :current_sign_in_ip, :string
  end
end
