# https://github.com/callemall/material-ui/issues/1439 - fix for styles?

module Home
  class Page < Hyperloop::Component
    include MuiTools

    before_mount do
      mutate.show_drawer false
    end

    render do
      # Mui.MuiThemeProvider(muiTheme: `{muiTheme}`) {
      Mui.MuiThemeProvider {
      DIV {
        app_bar
        drawer
        DIV(class: "app-content #{is_expanded}") {
          Grid {
            ProbeCards()
          }
        }
      }
    }
    end

    def app_bar
      Mui.AppBar(className: "app-bar #{is_expanded}", position: :static ) {
        Mui.Toolbar(type: :title) { Title {"Probe"} }
      }
    end

    def drawer
      Mui.Drawer(open: state.show_drawer, docked: true ) {
        Grid(fluid: true) {
          Row(center: :xs) {
            Col(xs: true) { IMG(src: 'robot.png', width: '200px') }
          }
          Row(center: :xs) {
            # Col(xs: true) { Mui.FloatingActionButton { Mui.FontIcon(className: 'i fa fa-plus') } }
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

  class ProbeCards < Hyperloop::Component
    include MuiTools

    render(DIV) do
      Probe.reverse.each do |probe|
        Probes::Item(probe: probe)
        BR()
      end
    end
  end

end
