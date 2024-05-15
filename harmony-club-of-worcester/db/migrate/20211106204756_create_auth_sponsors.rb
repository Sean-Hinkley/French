class CreateAuthSponsors < ActiveRecord::Migration[6.1]
  def change
    create_table :auth_sponsors do |t|
      t.string :beep

      t.timestamps
    end
  end
end
