module Probes

  class Item < Hyperloop::Component

    state show_modal: false

    render(DIV) do
      DIV(class: 'card cursor-pointer') {
        DIV(class: 'card-block') {
          DIV(class: 'card-title') {
            H4(class: "card-title") { "Sunny morning" }
          }
          DIV(class: 'card-text') { "I am a Probe" }
        }
      }.on(:click) do
        mutate.show_modal !state.show_modal
      end
      ItemModal(show_modal: state.show_modal) if state.show_modal
    end

  end

  class ItemModal < Hyperloop::Component

    param :show_modal

    render(DIV) do
      modal
    end

    before_mount do
    end

    def close
      puts "close"
    end

    def modal
      DIV {
        Bs.Modal(show: true, dialogClassName: "modal-xl", onHide: lambda { close }) {
          Bs.ModalHeader {
            # Modal.Modal.Title(id: 'ModalHeader') { "Here is the title " }
            H4 { "Header" }
          }
          Bs.ModalBody { P { "Body" } }
          # Modal.Footer {
          #   Modal.Modal.Dismiss(className: 'btn btn-default') { "Cancel"}
          # }
        }
      }
    end
  end

end
