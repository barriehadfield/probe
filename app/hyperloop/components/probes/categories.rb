class Category < Hyperloop::Component

  include MuiTools

  param :category
  param :name
  param :description

  param :edit_mode
  param :probe

  render(DIV) do
    Mui.Grid(item: true) {
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

      if params.probe["#{params.category}_bool"]
        DIV(class: 'left-indent') {
          BR()

          InputInplace(field: "#{params.category}_goals", model: params.probe, label: "Goals",
            placeholder: "What are you trying to achieve?", edit_mode: params.edit_mode)
          BR()

          InputInplace(field: "#{params.category}_signals", model: params.probe, label: "Signals",
            placeholder: "What signals do you expect to see?", edit_mode: params.edit_mode)
          BR()

          InputInplace(field: "#{params.category}_metrics", model: params.probe, label: "Metrics",
            placeholder: "And how will you measure this?", edit_mode: params.edit_mode)
          BR()
        }
      end
    }
  end

end
