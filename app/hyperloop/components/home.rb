module Home
  class Page < Hyperloop::Component
    render(DIV) do
      DIV(class: 'container-fluid outer') {
        BR()
        DIV(class: 'row') {
          DIV(class: 'col-md-3') {
            Filters()
          }
          DIV(class: 'col-md-9') {
            Cards()
          }
        }
      }
    end
  end

  class Filters < Hyperloop::Component

    render(DIV) do
      DIV(class: 'card shadow') {
        DIV(class: 'card-block') {
          DIV(class: 'card-title') {
            H5 {
              SPAN { "Probe " }
              SMALL(class: 'text-muted') { "- from late Latin proba ‘proof’, in medieval Latin ‘examination’, from Latin probare ‘to test’." }
            }
            BR()
            DIV(class: 'text-center') {
              Probes::Item(probe: Probe.new, new_probe: true)
            }
          }
        }
      }
    end
  end

  class Cards < Hyperloop::Component
    render(DIV) do
      Probe.reverse.each do |probe|
        Probes::Item(probe: probe)
      end
    end
  end

end
