module Probes

  class Item < Hyperloop::Component

    state show_modal: false

    render(DIV) do
      summary_card.on(:click) do
        mutate.show_modal !state.show_modal
      end
      modal if state.show_modal
    end

    def summary_card
      DIV(class: 'card cursor-pointer') {
        DIV(class: 'card-block') {
          DIV(class: 'card-title') {
            H4(class: "card-title") { "Sunny morning" }
          }
          DIV(class: 'card-text') { "I am a Probe" }
        }
      }
    end

    def modal
      DIV {
        Bs.Modal(show: state.show_modal, dialogClassName: "modal-xl", onHide: lambda { close }) {
          Bs.ModalHeader {
            H4 { "Header" }
          }
          Bs.ModalBody { P { "Body" } }
        }
      }
    end

    def close
      mutate.show_modal false
    end
  end

end
