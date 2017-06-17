module Probes

  class Item < Hyperloop::Component

    param :probe
    param new_probe: false

    state show_modal: false

    render(DIV) do
      if params.new_probe
        BUTTON(class: "btn btn-primary") {
          ProbeIcon()
          " New Probe"
        }.on(:click) do
          mutate.show_modal !state.show_modal
        end
      else
        summary_card.on(:click) do
          mutate.show_modal !state.show_modal
        end
      end
      modal if state.show_modal
    end

    def summary_card
      DIV(class: 'card shadow cursor-pointer') {
        DIV(class: 'card-block') {
          DIV(class: 'card-title') {
            H4(class: "card-title link") {
              ProbeIcon()
              " #{params.probe.name}"
            }
          }
          DIV(class: 'card-text') {
            P {"Body" }
          }
        }
      }
    end

    def modal
      Bs.Modal(show: state.show_modal, dialogClassName: "modal-xl", onHide: lambda { close }) {
        Bs.ModalHeader {
          H4 {
            ProbeIcon()
            " #{params.probe.name}"
          }
          SPAN(class: "text-right") {
            BUTTON(class: 'btn btn-secondary') { "Close" }.on(:click) { close }
          }
        }
        Bs.ModalBody { P { "Body" } }
      }
    end

    def close
      mutate.show_modal false
    end
  end

end
