module Probes

  class Item < Hyperloop::Component
    include MuiTools
    include GridTools

    param :probe

    render(DIV) do
      Mui.Card() {
        Mui.CardTitle(title: params.probe.name.to_s, showExpandableButton: true) {
          summary
        }
        Mui.CardText(expandable: true) {
          rate_card
        }
      }
    end

    def summary
      Caption { SafeTimeAgo(date: params.probe.created_at ) }
    end

    def rate_card
      #  Grid
      Grid {
        Cell(text: :right) {
          "Right aligned Cell"
        }
      }

      # Icon
      Mui.FontIcon(className: 'i fa fa-star', style: { marginLeft: 100 })

      #  Icon button
      Mui.IconButton(iconClassName: 'i fa fa-heart', onClick: -> { alert "clicked" })

      #  Icon menu working
      icon_button = `React.createElement(Mui.IconButton, { iconClassName: "i fa fa-cog" });`
      Mui.IconMenu(iconButtonElement: icon_button ) { }

      # ruby - dont show the button though ?
      button = Mui.IconButton(iconClassName: 'i fa fa-check')
      Mui.IconMenu(iconButtonElement: button.to_n ) { }

      #  Paper
      style = {
          height: 100,
          width: 300,
          margin: 20,
          textAlign: 'center',
          display: 'inline-block'
      }
      Mui.Paper(style: style, zDepth: 3) { P {"Hello there"} }

      #  Divider
      Mui.Divider()



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
#       mutate.show_save params.probe.changed?
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
