class AddOccurrenceToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :occurence, :string
  end
end
