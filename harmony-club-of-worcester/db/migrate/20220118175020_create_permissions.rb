class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.integer :role_id
      t.bigint :permissible_id
		  t.string :permissible_type
      t.boolean :allRecords
      t.boolean :canCreate
      t.boolean :canRead
      t.boolean :canUpdate
      t.boolean :canDelete

      t.timestamps
    end

    add_index :permissions, [:permissible_type, :permissible_id]
  end
end
