class CategoriesBools < ActiveRecord::Migration[5.1]
  def change
    add_column :probes, :happiness_bool, :boolean, default: false
    add_column :probes, :engagement_bool, :boolean, default: false
    add_column :probes, :adoption_bool, :boolean, default: false
    add_column :probes, :retention_bool, :boolean, default: false
    add_column :probes, :task_bool, :boolean, default: false
  end
end
