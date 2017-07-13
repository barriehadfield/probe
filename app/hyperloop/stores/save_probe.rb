class SaveProbeStore < Hyperloop::Store
  state hide_save: true, reader: true

  def set_hide_save value
    mutate.hide_save value
  end
end
