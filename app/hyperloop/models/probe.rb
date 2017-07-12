class Probe < ActiveRecord::Base

  has_many :updates

  def zero_out
    self.name = ''
    self.happiness_bool = false
    self.engagement_bool = false
    self.adoption_bool = false
    self.retention_bool = false
    self.task_bool = false
  end
end
