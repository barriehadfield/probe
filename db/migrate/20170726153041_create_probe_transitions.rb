class CreateProbeTransitions < ActiveRecord::Migration[5.1]
  def change
    create_table :probe_transitions, id: :integer do |t|
      t.string :to_state, null: false
      t.text :metadata
      t.integer :sort_key, null: false
      t.integer :probe_id, null: false
      t.boolean :most_recent
      t.timestamps null: false
    end

    # Foreign keys are optional, but highly recommended
    add_foreign_key :probe_transitions, :probes

    add_index(:probe_transitions,
              [:probe_id, :sort_key],
              unique: true,
              name: "index_probe_transitions_parent_sort")
    add_index(:probe_transitions,
              [:probe_id, :most_recent],
              unique: true,

              name: "index_probe_transitions_parent_most_recent")
  end
end
