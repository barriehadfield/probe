class AddDescription < ActiveRecord::Migration[5.1]
  def change
    add_column :probes, :description, :text
  end
end
