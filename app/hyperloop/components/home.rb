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

    # state is_open: false

    before_mount do
      mutate.is_open false
    end

    def toggle
      mutate.is_open !state.is_open
    end

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

              ButtonDropdown(class:'button-space', color: 'primary', isOpen: state.is_open, toggle: lambda { toggle }) {
                DropdownToggle(caret: true) {
                  "X"
                }
                DropdownMenu {
                  DropdownItem { "Edit and then something long"}
                  DropdownItem { "Delete"}
                }
              }

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
