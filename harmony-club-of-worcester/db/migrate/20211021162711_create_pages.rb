class CreatePages < ActiveRecord::Migration[6.1]
 
 
 
  def change
    create_table :pages do |t|
      t.string :title
      t.integer :section_id
      t.string :page_type
      t.string :permalink
      t.boolean :visible
      t.integer :position
      t.text :content

      t.timestamps
    end
    #add_index :pages, :slug, :unique => true
  end
end
