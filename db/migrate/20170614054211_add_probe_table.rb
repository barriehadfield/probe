class AddProbeTable < ActiveRecord::Migration[5.1]
  def change
    create_table :probes do |t|
      t.string :name
      t.timestamps
      t.index :id
    end
  end
end
