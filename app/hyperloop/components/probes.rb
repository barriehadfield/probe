module Probes

  class Item < Hyperloop::Component

    param :probe
    param new_probe: false

    state show_modal: false
    state edit_mode: false
    state dirty: false

    before_mount do
      mutate.edit_mode (params.new_probe ? true : false)
    end

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
              SPAN {" "}
              params.probe.name
            }
          }
          DIV(class: 'card-text') {
            P {"Body" }
          }
        }
      }
    end

    def inplace_field f, args = {}
      if state.edit_mode
        INPUT(args).on(:change) do |e|
          params.probe[f.to_s] = e.target.value
          mutate.dirty true
        end
      else
        SPAN { params.probe.send(f) }
      end
    end

    def save
      params.probe.save
      mutate.dirty false
    end

    def modal
      Bs.Modal(show: state.show_modal, dialogClassName: "modal-xl", onHide: lambda { close }) {
        Bs.ModalHeader {
          H4 {
            # ProbeIcon()
            # SPAN {" "}
            inplace_field :name, { placeholder: "Name", size: 60 }
          }
          SPAN(class: "text-right") {
            if state.dirty
              BUTTON(class: 'btn btn-success') { "Save" }.on(:click) { save }
              BUTTON(class: 'btn btn-secondary') { "Cancel" }.on(:click) { close }
            else
              BUTTON(class: 'btn btn-secondary') { "Close" }.on(:click) { close }
            end
          }
        }
        Bs.ModalBody {
          P { "name: #{params.probe.name}" }
        }
      }
    end

    def close
      mutate.show_modal false
    end
  end

end
