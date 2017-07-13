class Category < Hyperloop::Component

  include MuiTools

  param :category
  param :name
  param :description

  param :edit_mode
  param :probe

  render(DIV) do
    Mui.Grid(item: true) {
      category_toggle
      category_fields
      updates
    }
  end

  def updates
    if params.probe["#{params.category}_bool"] && !params.edit_mode
      CategoryUpdates(probe: params.probe)
      last_update
    end
  end

  def last_update
    DIV(class: 'left-indent') {
      Mui.Grid(container: true) {
        Mui.Grid(item: true) {
          Mui.Avatar() { HeartIcon() }
        }
        Mui.Grid(item: true) {
          P { params.probe.updates.last.body.to_s }
          Caption { SPAN { "Updated " }
            SafeTimeAgo(date: params.probe.updates.last.created_at )
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
