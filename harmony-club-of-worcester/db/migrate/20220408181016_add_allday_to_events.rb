class AddAlldayToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :allday, :boolean
  end
end
