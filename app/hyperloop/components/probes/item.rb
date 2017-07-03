module Probes

  class Item < Hyperloop::Component
    include MuiTools

    param :probe

    before_mount do
      mutate.edit_mode false
    end

    render(DIV) do
      Mui.Card {
        Grid(fluid: true) {
          heading
          body
        }
      }
    end

    def checked? test
      if test == 't'
        ret = true
      else
        ret = false
      end
      ret
    end

    def heading
      Row {  Col { BR() }}
      Row {
        Col {
          Display1 { params.probe.name }
        }
      }
      Row {
        Col {
          Caption { SafeTimeAgo(date: params.probe.created_at ) }
        }
      }
      Mui.Divider()
      BR()
    end

    def body
      Grid(fluid: true) {
        Row {
          Col(xs: 11) {
            # Title { "HEART" }
            if state.edit_mode
              SubHeading1 { "Choose one or more categories in the HEART framework that are the focus of this Probe (product or project)." }
              BR()
            end
          }
          Col(xs: 1) {
            BUTTON {"Edit"}.on(:click) { mutate.edit_mode !state.edit_mode }

            BUTTON {"Save"}.on(:click) {
              params.probe.save
              mutate.edit_mode false
            }  if params.probe.changed?
          }
        }

        Row {
          Col(xs: 1) {
            Mui.Switch(checked: checked?(params.probe.happiness_bool) ).on(:change) {
              if params.probe.happiness_bool == 't'
                params.probe.happiness_bool = 'f'
              else
                params.probe.happiness_bool = 't'
              end
            }
          } if state.edit_mode

          Col(xs: true) {
            if params.probe.happiness_bool == 't' || state.edit_mode
              Headline { "Happiness" }
              Body1 { "Measures of user's attitudes" }
            end
            if params.probe.happiness_bool == 't'
              BR()
              HappinessCategorie(edit_mode: state.edit_mode, probe: params.probe)
            end
          }
        }

        BR()
        BR()

        # Row {
        #   Col(xs: 1) { toggle } if state.settings
        #   Col(xs: true) {
        #     Title { "Engagement" }
        #     Body1 { "Level of user involvement" }
        #   }
        # }
        #
        # Row {
        #   Col(xs: 1) { toggle } if state.settings
        #   Col(xs: true) {
        #     Title { "Adoption" }
        #     Body1 { "Gaining new users of a product or feature" }
        #   }
        # }
        #
        # Row {
        #   Col(xs: 1) { toggle } if state.settings
        #   Col(xs: true) {
        #     Title { "Retention" }
        #     Body1 { "Rate at which existing users are returning" }
        #   }
        # }
        #
        # Row {
        #   Col(xs: 1) { toggle } if state.settings
        #   Col(xs: true) {
        #     Title { "Task Success" }
        #     Body1 { "Efficiency, effectiveness, and error rate" }
        #   }
        # }

      }

    end

    def toggle
      Mui.Switch()
    end

    def icon
      Mui.FontIcon(className: 'i fa fa-cog', style: {marginRight: 10})
    end

    def menu

      Mui.IconMenu(iconButtonElement: icon ) {

      }
    end

  end


end

# module Probes
#
#   class Item < Hyperloop::Component
#
#     param :probe
#     param new_probe: false
#
#     state show_modal: false
#     state edit_mode: false
#
#     before_mount do
#       mutate.edit_mode (params.new_probe ? true : false)
#       # mutate.active_tab 1
#     end
#
#     render(DIV) do
#       if params.new_probe
#         Button(color: "primary") {
#           ProbeIcon()
#           " New Probe"
#         }.on(:click) do
#           mutate.show_modal !state.show_modal
#         end
#       else
#         summary_card.on(:click) do
#           mutate.show_modal !state.show_modal
#         end
#       end
#       modal if state.show_modal
#     end
#
#     def delete
#       params.probe.destroy
#       close
#     end
#
#     def reset
#       params.probe.revert if params.probe.changed?
#       mutate.edit_mode false unless params.new_probe
#       mutate.should_delete false
#     end
#
#     def close
#       reset
#       mutate.show_modal false
#     end
#
#     def save
#       params.probe.save
#       mutate.edit_mode false
#     end
#
#     def summary_card
#       Card(class: 'shadow cursor-pointer') {
#         CardBlock {
#           CardTitle {
#             SPAN(class: 'link') {
#               ProbeIcon()
#               SPAN { " #{params.probe.name}" }
#             }
#           }
#           CardText {
#             SPAN {"Created: "}
#             SafeTimeAgo(date: params.probe.created_at )
#           }
#         }
#       }
#     end
#
#     def modal
#       Modal(isOpen: state.show_modal, class: "modal-xl", toggle: -> { close }) {
#         ModalHeader(toggle: -> { close }) {
#           params.probe.name || "New Probe"
#         }
#         ModalBody {
#           modal_body
#         }
#         ModalFooter {
#           modal_footer
#         }
#       }
#     end
#
#     def modal_body
#       ProbeTabs(probe: params.probe, edit_mode: state.edit_mode)
#     end
#
#     def modal_footer
#       if state.should_delete
#         Button(color: 'danger', size: 'sm', onClick: -> { delete }) { "Confirm Delete" }
#       end
#       bad: mutate.show_save params.probe.changed?
#       Button(color: 'success', onClick: -> { save }) { SaveIcon() } if state.show_save
#       UncontrolledDropdown( color: 'primary') {
#         DropdownToggle(caret: true) { SettingsIcon() }
#         DropdownMenu {
#           DropdownItem(onClick: -> { mutate.edit_mode true }) { "Edit"}
#           DropdownItem(onClick: -> { mutate.should_delete true }) { "Delete"}
#         }
#       }
#     end
#   end
#
# end
