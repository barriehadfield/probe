module Home
  class Page < Hyperloop::Component
    render(DIV) do
      DIV(class: 'container') {
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
              "Welcome Andy"
            }
            P { "Lots of new things have happened since you were last here." }
            Probes::Item(probe: Probe.new, new_probe: true)
          }
        }
      }
    end
  end

  class Cards < Hyperloop::Component
    render(DIV) do
      Probe.all.each do |probe|
        Probes::Item(probe: probe)
        BR()
      end
    end
  end

end
