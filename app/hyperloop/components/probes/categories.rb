class Category < Hyperloop::Component

  include MuiTools

  param :category
  param :name
  param :description
  param :hide_save_store

  param :edit_mode
  param :probe

  before_mount do
    mutate.show_more false
  end

  render(DIV) do
    Mui.Grid(item: true) {
      category_toggle
      category_fields
      updates
    }
  end

  def updates
    if params.probe["#{params.category}_bool"] && !params.edit_mode
      CategoryUpdates(probe: params.probe, hide_save_store: params.hide_save_store)
      last_update
      if params.probe.updates.count > 1
        Mui.Button() { "More" }.on(:click) do
          mutate.show_more true
        end unless state.show_more
      end
      if state.show_more
        params.probe.updates.reverse.drop(1).each do |u|
          update u
        end
      end
    end
  end

  def last_update
    update params.probe.updates.last if params.probe.updates.last
  end

  def update u
    DIV(class: 'left-indent') {
      Mui.Grid(container: true) {
        Mui.Grid(item: true) {
          Mui.Avatar() { HeartIcon() }
        }
        Mui.Grid(item: true) {
          P { u.body.to_s }
          Caption { SPAN { "Updated " }
            SafeTimeAgo(date: u.created_at )
          }
        }
      }
    }
  end

  def category_toggle
    if params.probe["#{params.category}_bool"] || params.edit_mode
      Mui.Divider(light: true)
      BR()

      Mui.Grid(container: true, align: :center) {
        Mui.Grid(item: true) {
          SPAN {
              Mui.Switch(checked: params.probe["#{params.category}_bool"] ).on(:change) {
                params.probe["#{params.category}_bool"] = !params.probe["#{params.category}_bool"]
              }
          } if params.edit_mode
        }
        Mui.Grid { Title(element: :span) { params.name.upcase } }
        Mui.Grid(item: true) { Body1 { params.description } } if params.edit_mode
      }
    end
  end

  def category_fields
    if params.probe["#{params.category}_bool"]
      DIV(class: 'left-indent') {

        InputInplace(field: "#{params.category}_goals", model: params.probe, label: "Goals",
          placeholder: "What are you trying to achieve?", edit_mode: params.edit_mode)

        InputInplace(field: "#{params.category}_signals", model: params.probe, label: "Signals",
          placeholder: "What signals do you expect to see?", edit_mode: params.edit_mode)

        InputInplace(field: "#{params.category}_metrics", model: params.probe, label: "Metrics",
          placeholder: "And how will you measure this?", edit_mode: params.edit_mode)
      }
    end
  end

end
