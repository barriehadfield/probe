# https://github.com/callemall/material-ui/issues/1439 - fix for styles?

module Home
  class Page < Hyperloop::Component
    include MuiTools

    render do
      # Mui.MuiThemeProvider(muiTheme: `{muiTheme}`) {
      Mui.MuiThemeProvider {
      DIV {
        Grid {
          Row {
            app_bar
          }
          Row {
            Col(sm: 2) { drawer }
            Col(sm: 10) { ProbeCards() }
          }
        }
      }
    }
    end

    def app_bar
      Mui.AppBar(position: :static) {
        Mui.Toolbar(type: :title) { Title {"Probe"} }
      }
    end

    def drawer
      Grid(fluid: true) {
        Row(center: :xs) {
          Col(xs: true) { IMG(src: 'robot-pink.png', width: '180px') }
        }
        Row(center: :xs) {
          # Col(xs: true) { Mui.FloatingActionButton { Mui.FontIcon(className: 'i fa fa-plus') } }
        }
      }
    end

  end

  class ProbeCards < Hyperloop::Component
    include MuiTools

    render(DIV) do
      BR()
      Grid(fluid: true) {
        Probe.reverse.each do |probe|
          Row {
            Col {
              Probes::Item(probe: probe)
            }
          }
          BR()
        end
      }
    end
  end

end
