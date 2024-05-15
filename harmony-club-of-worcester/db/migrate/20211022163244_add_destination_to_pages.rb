class AddDestinationToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :destination, :string
  end
end
