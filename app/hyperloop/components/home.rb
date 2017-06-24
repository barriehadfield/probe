module Home
  class Page < Hyperloop::Component

    render do
      Mat.MuiThemeProvider {
      DIV {
        Mat.AppBar(className: "app-bar #{is_expanded}", title: 'Probe', onLeftIconButtonTouchTap: -> { toggle_drawer } )
        Mat.Drawer(open: state.show_drawer || false) {
          Mat.MenuItem { "The big one" }
          Mat.MenuItem { "And the next" }
          Mat.FlatButton(label: 'New Probe', primary: true, onClick: -> { alert "click click" })
        }
        DIV(class: "app-content #{is_expanded}") {
          # Mat.FlatButton(label: 'New Probe', primary: true, onClick: -> { alert "click click" })
          H1(class: 'mdc-typography--display1') { "Big?" }
          ProbeCards()
        }
      }
    }
    end

    def toggle_drawer
      mutate.show_drawer !state.show_drawer
    end

    def is_expanded
      state.show_drawer ? 'expanded' : ''
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
