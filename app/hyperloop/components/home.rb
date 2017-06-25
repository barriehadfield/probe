module Home
  class Page < Hyperloop::Component
    include MuiTools

    before_mount do
      mutate.show_drawer true
    end

    render do
      Mui.MuiThemeProvider {
      DIV {
        Mui.AppBar(className: "app-bar #{is_expanded}", title: 'Probe', onLeftIconButtonTouchTap: -> { toggle_drawer } )
        Mui.Drawer(open: state.show_drawer ) {
          Mui.MenuItem { "The big one" }
          Mui.MenuItem { "And the next" }
          Mui.FlatButton(label: 'New Probe', primary: true, onClick: -> { alert "click click" })
        }
        DIV(class: "app-content #{is_expanded}") {
          # Mui.FlatButton(label: 'New Probe', primary: true, onClick: -> { alert "click click" })
          Display1 { "Big?" }
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
