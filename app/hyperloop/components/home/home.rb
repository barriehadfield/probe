# https://github.com/callemall/material-ui/issues/1439 - fix for styles?

module Home
  class Page < Hyperloop::Component
    include MuiTools

    render do
      # Mui.MuiThemeProvider(muiTheme: `{muiTheme}`) {
      Mui.MuiThemeProvider {
      DIV {
        app_bar
        # Mui.Grid(container: true) {
          # Mui.Grid(item: true, md: 2) { drawer }
          ProbeCards()
        }
      # }
    }
    end

    def app_bar
      Mui.AppBar(position: :static) {
        Mui.Toolbar(type: :title) { Title {"Probe"} }
      }
    end

    def drawer
      IMG(src: 'robot-pink.png', width: '180px')
    end

  end

  class ProbeCards < Hyperloop::Component
    include MuiTools

    render(DIV) do
      # BR()
      # rate_card
      # BR()
      # font_card
      BR()
      Mui.Grid(container: true, justify: 'center', gutter: 16, direction: :column, className: 'main-container') {
        Probe.reverse.each do |probe|
          Probes::Item(probe: probe)
          BR()
        end
      }
    end
  end

end
