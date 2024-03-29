module Home
  class Page < Hyperloop::Component
    render do
      Container(class: 'outer', fluid: true) {
        BR()
        Row {
          Col(md: 3) {
            Filters()
          }
          Col(md: 9) {
            ProbeCards()
          }
        }
      }
    end
  end

  class Filters < Hyperloop::Component
    render do
      Card(class: 'shadow') {
        CardBlock {
          CardTitle { "Workshare Probe" }
          Probes::Item(probe: Probe.new, new_probe: true)
        }
      }
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
