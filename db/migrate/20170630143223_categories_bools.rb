class CategoriesBools < ActiveRecord::Migration[5.1]
  def change
    add_column :probes, :happiness_bool, :boolian, default: false
    add_column :probes, :engagement_bool, :boolian, default: false
    add_column :probes, :adoption_bool, :boolian, default: false
    add_column :probes, :retention_bool, :boolian, default: false
    add_column :probes, :task_bool, :boolian, default: false
  end
end
