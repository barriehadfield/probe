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
      Card(class: 'shadow cursor-pointer') {
        CardBlock {
          CardTitle {
            SPAN(class: 'link') {
              ProbeIcon()
              SPAN { " #{params.probe.name}" }
            }
          }
          CardText {
            "Body"
          }
        }
      }
    end

    def input_inplace field, args = {}
      if state.edit_mode
        Input( { type: 'text', defaultValue: params.probe.send(field) }.merge(args) ).on(:change) do |e|
          params.probe[field.to_s] = e.target.value
          mutate.dirty true
        end
      else
        SPAN { params.probe.send(field) }
      end
    end

    def modal
      Modal(isOpen: state.show_modal, class: "modal-xl", toggle: -> { close }) {
        ModalHeader(toggle: -> { close }) {
          params.probe.name || "New Probe"
        }
        ModalBody {
          input_inplace :name, { placeholder: "Probe Name" } if state.edit_mode
          Row {
            Col(md: 6) { "xxx" }
            Col(md: 6) { "yyy" }
          }
        }
        ModalFooter {
          modal_footer
        }
      }
    end

    def modal_footer
      if state.should_delete
        Button(color: 'danger', size: 'sm', onClick: -> { delete }) { "Confirm Delete" }
      end
      Button(color: 'success', onClick: -> { save }) { SaveIcon() } if state.dirty
      UncontrolledDropdown( color: 'primary') {
          DropdownToggle(caret: true) { SettingsIcon() }
          DropdownMenu {
            DropdownItem(onClick: -> { edit }) { "Edit"}
            DropdownItem(onClick: -> { mutate.should_delete true }) { "Delete"}
          }
      }
    end

    def delete
      params.probe.destroy
      close
    end

    def edit
      mutate.edit_mode true
    end

    def reset
      params.probe.revert if state.dirty
      mutate.edit_mode false unless params.new_probe
      mutate.dirty false
      mutate.should_delete false
    end

    def close
      reset
      mutate.show_modal false
    end

    def save
      params.probe.save
      mutate.dirty false
      close
    end

  end

end
