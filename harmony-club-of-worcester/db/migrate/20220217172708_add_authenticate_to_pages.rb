class AddAuthenticateToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :authenticate, :boolean
  end
end
