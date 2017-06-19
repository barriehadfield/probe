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

    def input_inplace field, args = {}
      if state.edit_mode
        INPUT({}.merge(args)).on(:change) do |e|
          params.probe[field.to_s] = e.target.value
          mutate.dirty true
        end
      else
        SPAN { params.probe.send(field) }
      end
    end

    def save
      params.probe.save
      mutate.dirty false
    end

    def modal
      Modal(isOpen: state.show_modal, class: "modal-xl", toggle: lambda { close }) {
        ModalHeader {
          H4 {
            SPAN { "Probe # #{params.probe.id} " }
          }
        }
        ModalBody {
          P {
            input_inplace :name, { placeholder: "Name" }
            Row {
              Col(md: 6) { "xxx" }
              Col(md: 6) { "yyy" }
            }
          }
        }
        ModalFooter {
          modal_footer
        }
      }
    end

    def modal_footer
      ButtonDropdown(
        color: 'primary',
        isOpen: (state.is_open || false),
        toggle: -> { mutate.is_open !state.is_open }) {
          DropdownToggle(caret: true) { SettingsIcon() }
          DropdownMenu {
            DropdownItem(onClick: lambda { edit }) { "Edit"}
            DropdownItem { "Delete"}
          }
      }
      Button(color: 'success', onClick: -> { save }) { SaveIcon() }
      Button(color: 'secondary', onClick: -> { close }) { CloseIcon() }
    end

    def edit
      mutate.edit_mode true
    end

    def close
      mutate.show_modal false
    end
  end

end
