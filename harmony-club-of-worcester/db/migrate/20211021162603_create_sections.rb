class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :location
      t.string :title
      t.boolean :visible
      t.integer :position

      t.timestamps
    end
  end
end
