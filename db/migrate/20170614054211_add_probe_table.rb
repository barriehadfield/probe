class AddProbeTable < ActiveRecord::Migration[5.1]
  def change
    create_table :probes, id: false do |t|
      t.integer :id
      t.string :name
      t.timestamps
      t.index :id
    end
  end
end
