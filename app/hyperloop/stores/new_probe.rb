class NewProbeStore < Hyperloop::Store
  state show: false, scope: :class, reader: true

  def self.set value
    mutate.show value
  end
end
