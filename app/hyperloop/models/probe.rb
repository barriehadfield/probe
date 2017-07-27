class ProbeStateMachine
  include Statesman::Machine

  state :pending, initial: true
  state :checking_out
  state :purchased
  state :shipped
  state :cancelled
  state :failed
  state :refunded

  transition from: :pending,      to: [:checking_out, :cancelled]
  transition from: :checking_out, to: [:purchased, :cancelled]
  transition from: :purchased,    to: [:shipped, :failed]
  transition from: :shipped,      to: :refunded
  transition from: :cancelled,    to: :refunded

  guard_transition(to: :checking_out) do |probe|
    puts "probe guard called"
  end

end


class Probe < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordQueries

  has_many :probe_transitions, autosave: false
  has_many :updates

  def state_machine
    @state_machine ||= ProbeStateMachine.new(self, transition_class: ProbeTransition)
  end

  def self.transition_class
    ProbeTransition
  end

  def self.initial_state
    :pending
  end

  private_class_method :initial_state

  def zero_out
    self.name = ''
    self.happiness_bool = false
    self.engagement_bool = false
    self.adoption_bool = false
    self.retention_bool = false
    self.task_bool = false
  end
end

class ProbeTransition < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordTransition

  belongs_to :probe, inverse_of: :probe_transitions
end
