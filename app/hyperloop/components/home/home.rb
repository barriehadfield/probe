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
        DIV(class: "app-content #{is_expanded}") {
          BR()
          ProbeCards()
        }
      }
    }
    end

    def app_bar
      Mui.AppBar(className: "app-bar #{is_expanded}", title: 'Probe', onLeftIconButtonTouchTap: -> { toggle_drawer } )
      Mui.Drawer(open: state.show_drawer ) {
        # BR()
        Grid(fluid: true) {
          Row(center: :xs) {
            Col(xs: true) { IMG(src: 'robot.png', width: '200px') }
          }
          Row(center: :xs) {
            Col(xs: true) { Mui.FloatingActionButton { Mui.FontIcon(className: 'i fa fa-plus') } }
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
    render(DIV) do

      # Grid(fluid: true) {
      #   Row() {
      #     Col(xs: true) { "One" }
      #     Col(xs: true) { "Two" }
      #     Col(xs: true) { "Tree" }
      #     Col(xs: true) { "Four" }
      #     Col(xs: true) { "Five" }
      #   }
      # }

      Probe.reverse.each do |probe|
        Probes::Item(probe: probe)
      end
    end
  end

end
