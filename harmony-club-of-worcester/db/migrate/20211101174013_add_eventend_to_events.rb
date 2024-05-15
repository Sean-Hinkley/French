class AddEventendToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :eventend, :datetime
  end
end
