# https://github.com/callemall/material-ui/issues/1439 - fix for styles?

module Home
  class Page < Hyperloop::Component
    include MuiTools

    before_mount do
      mutate.show_drawer true
    end

    render do
      # Mui.MuiThemeProvider(muiTheme: `{muiTheme}`) {
      Mui.MuiThemeProvider {
      DIV {
        app_bar
        # DIV(class: "app-content #{is_expanded}") {
        #   BR()
          ProbeCards()
        # }
      }
    }
    end

    def app_bar
      Mui.AppBar(className: "app-bar #{is_expanded}", title: 'Probe', onClick: -> { toggle_drawer } )
      # Mui.Drawer(open: state.show_drawer ) {
      #   Grid(fluid: true) {
      #     Row(center: :xs) {
      #       Col(xs: true) { IMG(src: 'robot.png', width: '200px') }
      #     }
      #     Row(center: :xs) {
      #       # Col(xs: true) { Mui.FloatingActionButton { Mui.FontIcon(className: 'i fa fa-plus') } }
      #     }
      #   }
      # }
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
      Mui.Paper(elevation: 4) {
        font_card
      }

      Mui.Paper {
        rate_card
      }

      # Probe.reverse.each do |probe|
      #   Probes::Item(probe: probe)
      # end
    end
  end

end
