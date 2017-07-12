class AddCattoUpdate < ActiveRecord::Migration[5.1]
  def change
    add_column :updates, :category, :string
    add_index :updates, :category
  end
end
