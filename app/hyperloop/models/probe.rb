class Probe < ActiveRecord::Base
  def zero_out
    self.name = ''
    self.happiness_bool = false
    self.engagement_bool = false
    self.adoption_bool = false
    self.retention_bool = false
    self.task_bool = false
  end
end
