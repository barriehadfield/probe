module Home
  class Page < Hyperloop::Component
    include MuiTools
    include GridTools

    before_mount do
      mutate.show_drawer true
    end

    render do
      Mui.MuiThemeProvider {
      DIV {
        app_bar
        DIV(class: "app-content #{is_expanded}") {
          # Mui.FlatButton(label: 'New Probe', primary: true, onClick: -> { alert "click click" })
          # Display1 { "Big?" }
          ProbeCards()
        }
      }
    }
    end

    def app_bar
      Mui.AppBar(className: "app-bar #{is_expanded}", title: 'Probe', onLeftIconButtonTouchTap: -> { toggle_drawer } )
      Mui.Drawer(open: state.show_drawer ) {
        BR()
        Grid(gutters: true) {
          Cell(text: :center, gutters: true) { IMG(src: 'robot.png', width: '150px') }
        }
        Grid {
          Cell(text: :center) {
              Mui.FlatButton(label: 'New Probe', primary: true, onClick: -> { alert "click click" })
          }
        }

        Mui.MenuItem { "And the next" }
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
