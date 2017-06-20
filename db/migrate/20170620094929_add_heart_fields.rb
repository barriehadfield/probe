class AddHeartFields < ActiveRecord::Migration[5.1]
  def change
    add_column :probes, :happiness_goals, :text
    add_column :probes, :happiness_signals, :text
    add_column :probes, :happiness_metrics, :text

    add_column :probes, :engagement_goals, :text
    add_column :probes, :engagement_signals, :text
    add_column :probes, :engagement_metrics, :text

    add_column :probes, :adoption_goals, :text
    add_column :probes, :adoption_signals, :text
    add_column :probes, :adoption_metrics, :text

    add_column :probes, :retention_goals, :text
    add_column :probes, :retention_signals, :text
    add_column :probes, :retention_metrics, :text

    add_column :probes, :task_goals, :text
    add_column :probes, :task_signals, :text
    add_column :probes, :task_metrics, :text
  end
end
