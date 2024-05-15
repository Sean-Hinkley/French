class AddEventstartToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :eventstart, :datetime
  end
end
