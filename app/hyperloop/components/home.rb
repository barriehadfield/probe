module Home
  class Page < Hyperloop::Component

    render do
      Mat.MuiThemeProvider {
        DIV {
          DIV(class: '') {
            Mat.Drawer(open: state.show_drawer || false) {
              Mat.MenuItem { "Close" }.on(:click) { mutate.show_drawer false }
              Mat.MenuItem { "The big one" }
              Mat.MenuItem { "And the next" }
              Mat.FlatButton(label: 'New Probe', primary: true, onClick: -> { alert "click click" })
            }
          }
          DIV(class: '') {
            Mat.AppBar(className: 'app-bar', title: 'Probe', onLeftIconButtonTouchTap: -> { mutate.show_drawer true } )
            # Mat.FlatButton(label: 'New Probe', primary: true, onClick: -> { alert "click click" })
            H1(class: 'mdc-typography--display1') { "Big?" }
            ProbeCards()
          }
        }
      }
    #   Container(class: 'outer', fluid: true) {
    #     BR()
    #     Row {
    #       Col(md: 3) {
    #         Filters()
    #       }
    #       Col(md: 9) {
    #         ProbeCards()
    #       }
    #     }
    #   }
    end

  end

  class Filters < Hyperloop::Component
    render do
      # Card(class: 'shadow') {
      #   CardBlock {
      #     CardTitle { "Workshare Probe" }
      #     Probes::Item(probe: Probe.new, new_probe: true)
      #   }
      # }
    end
  end

  class ProbeCards < Hyperloop::Component
    render(DIV) do
      Probe.reverse.each do |probe|
        Probes::Item(probe: probe)
      end
    end
  end

end
