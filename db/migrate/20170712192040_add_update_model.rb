class AddUpdateModel < ActiveRecord::Migration[5.1]
  def change
    create_table :updates do |t|
      t.text :body
      t.timestamps
      t.integer :probe_id
      t.index :id
    end
    add_index :updates, :probe_id
  end
end
