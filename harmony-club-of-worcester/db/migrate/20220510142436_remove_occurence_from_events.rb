class RemoveOccurenceFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :occurence, :string
  end
end
