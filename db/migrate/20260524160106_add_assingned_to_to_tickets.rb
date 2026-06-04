class AddAssingnedToToTickets < ActiveRecord::Migration[8.1]
  def change
    add_column :tickets, :assigned_to_id, :integer
  end
end
