# https://github.com/callemall/material-ui/issues/1439 - fix for styles?

module Home
  class Page < Hyperloop::Component
    include MuiTools

    render do
      # Mui.MuiThemeProvider(muiTheme: `{muiTheme}`) {
      Mui.MuiThemeProvider {
      DIV {
        app_bar
        Mui.Grid(container: true) {
          Mui.Grid(item: true, xs: 2) { drawer }
          Mui.Grid(item: true, xs: 12, sm: 10) { paper }
        }
      }
    }
    end

    def paper
      #  Paper
      style = {
          height: 100,
          width: '100%',
          margin: 20,
          textAlign: 'center',
          display: 'inline-block'
      }
      Mui.Paper() { P {"Hello there"} }
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
      Probe.reverse.each do |probe|
        # Probes::Item(probe: probe)
        BR()
      end
    end
  end

end
