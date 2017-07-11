module Probes

  class Item < Hyperloop::Component
    include MuiTools

    param :probe
    param :new_probe, default: false

    before_mount do
      mutate.hide_save false
      mutate.edit_mode (params.new_probe ? true : false)
    end

    render(DIV) do
      if params.new_probe
        card if NewProbeStore.show
      else
        card
      end
    end

    def card
      Mui.Card(className: 'main-card', raised: true) {
        heading
        body
      }
    end

    def heading
      Mui.Grid(container: true) {
        Mui.Grid(item: true, xs: 10) {
            Headline { params.probe.name }
            Caption { SPAN { "Updated " }
              SafeTimeAgo(date: params.probe.created_at )
            }
          }
        Mui.Grid(item: true, xs: 2) {
          buttons
        }
      }
    end

    def cancel
      params.probe.revert
      mutate.edit_mode false
    end

    def save
      mutate.hide_save true
      mutate.edit_mode false

      params.probe.save do |response|
        mutate.hide_save false
        # Mui.Snackbar(message: "Changes saved", vertical: 'bottom', horizontal: 'right') { "xx" }
      end
    end

    def edit
      mutate.edit_mode !state.edit_mode
    end

    def buttons
      Mui.Grid(container: true, justify: 'flex-end') {
        if state.edit_mode
          Mui.IconButton(onClick: -> { cancel } ) { CloseIcon() }
        else
          Mui.IconButton(onClick: -> { edit } ) { SettingsIcon() }
        end

        # Mui.IconButton(color: :accent, onClick: -> { save } ) {
        Mui.Button(fab: true, color: :accent, onClick: -> { save }) { 
          SaveIcon()
        } if params.probe.changed? && !state.hide_save
      }
    end

    def body
      Mui.Grid(container: true,  direction: :column) {

        Mui.Grid(item: true) {
          if state.edit_mode
            SubHeading1 { "Choose one or more categories in the HEART framework that are the focus of this Probe (product or project)." }
          end
        }

        [ { categorie: :happiness, name: "Happiness", description: "Measures of user's attitudes" },
          { categorie: :engagement, name: "Engagement", description: "Level of user involvement" },
          { categorie: :adoption, name: "Adoption", description: "Gaining new users" },
          { categorie: :retention, name: "Retention", description: "Rate at which existing users are returning" },
          { categorie: :task, name: "Task Success", description: "Efficiency, effectiveness, and error rat" }
        ].each do |cat|
          Categorie(categorie: cat[:categorie], name: cat[:name], description: cat[:description],
            edit_mode: state.edit_mode, probe: params.probe)
        end
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
