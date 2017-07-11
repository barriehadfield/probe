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

    before_mount do
      @dummy = Probe.new
      @dummy.zero_out
    end

    render(DIV) do
      new_probe_fab unless NewProbeStore.show

      Mui.Grid(container: true, justify: 'center', gutter: 16, direction: :column, className: 'main-container') {

        Probes::Item(probe: @dummy, new_probe: true, key: :unsaved)
        BR()

        Probe.reverse.each do |probe|
          Probes::Item(probe: probe, key: probe.id)
          BR()
        end
      }
    end

    def new_probe_fab
      Mui.Grid(container: true, justify: 'flex-end', className: 'main-container add-probe-fab') {
        Mui.Grid(item:true) {
          Mui.Button(fab: true, color: :primary, onClick: -> { new_probe }) { NewProbeIcon() }
        }
      }
    end

    def new_probe
      @dummy = Probe.new
      @dummy.zero_out
      NewProbeStore.set_show !NewProbeStore.show
    end
  end

end
