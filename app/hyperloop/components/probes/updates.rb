class CategoryUpdates < Hyperloop::Component
  param :probe
  param :hide_save_store

  before_mount do
    reset
  end

  render(DIV) do
    Mui.Grid(container: true, justify: 'flex-end') {
      if state.update_mode
        Mui.IconButton(onClick: -> { cancel } ) { CloseIcon() }
        Mui.IconButton(color: :accent, onClick: -> { save } ) { SaveIcon() }
      else
        Mui.Button(color: :primary, onClick: -> { mutate.show_new_update !state.show_new_update }) { "Update" }
      end
    }
    new_update if state.show_new_update
  end

  def reset
    @body = ''
    mutate.show_new_update false
    mutate.update_mode false
  end

  def save
    update = Update.new
    update.probe_id = params.probe.id
    update.body = @body
    update.save do |res|
      params.probe.updated_at = update.created_at
      params.probe.save
      reset
      params.hide_save_store.set_hide_save = true
    end
  end

  def cancel
    reset
  end

  def new_update
    Mui.TextField(label: 'Update', style: { width: '100%' }, multiline: true, autoFocus: true).on(:change) do |e|
      @body = e.target.value
      mutate.update_mode true
    end
  end

end
