class AddOccurenceToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :occurence, :integer
  end
end
