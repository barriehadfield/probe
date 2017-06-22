module Probes

  class Item < Hyperloop::Component

    param :probe
    param new_probe: false

    state show_modal: false
    state edit_mode: false
    # state dirty: false

    before_mount do
      mutate.edit_mode (params.new_probe ? true : false)
      mutate.active_tab 1
    end

    render(DIV) do
      if params.new_probe
        Button(color: "primary") {
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

    def delete
      params.probe.destroy
      close
    end

    def reset
      params.probe.revert if params.probe.changed?
      mutate.edit_mode false unless params.new_probe
      # mutate.dirty false
      mutate.should_delete false
    end

    def close
      reset
      mutate.show_modal false
    end

    def save
      params.probe.save
      # mutate.dirty false
      mutate.edit_mode false
      # close
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
            SPAN {"Created: "}
            SafeTimeAgo(date: params.probe.created_at )
          }
        }
      }
    end

    def modal
      Modal(isOpen: state.show_modal, class: "modal-xl", toggle: -> { close }) {
        ModalHeader(toggle: -> { close }) {
          params.probe.name || "New Probe"
        }
        ModalBody {
          modal_body
        }
        ModalFooter {
          modal_footer
        }
      }
    end

    def modal_body
      tabs
      tab_content
    end

    def modal_footer
      if state.should_delete
        Button(color: 'danger', size: 'sm', onClick: -> { delete }) { "Confirm Delete" }
      end
      mutate.show_save params.probe.changed?
      Button(color: 'success', onClick: -> { save }) { SaveIcon() } if state.show_save
      UncontrolledDropdown( color: 'primary') {
        DropdownToggle(caret: true) { SettingsIcon() }
        DropdownMenu {
          DropdownItem(onClick: -> { mutate.edit_mode true }) { "Edit"}
          DropdownItem(onClick: -> { mutate.should_delete true }) { "Delete"}
        }
      }
    end

    # def input_inplace field, label = nil, args = {}
    #   if state.edit_mode
    #     Label { label } if label
    #     Input( { defaultValue: params.probe.send(field) }.merge(args) ).on(:change) do |e|
    #       params.probe[field.to_s] = e.target.value
    #       # mutate.dirty true
    #     end
    #   else
    #     P { label } if label
    #     P { params.probe.send(field) }
    #   end
    # end

    def tabs
      Nav(tabs: true) {
        NavItem {
          NavLink( class: 'cursor-pointer', active: state.active_tab == 1, onClick: -> { mutate.active_tab 1 } ) {
            "HEART"
          }
        }
        NavItem {
          NavLink( class: 'cursor-pointer', active: state.active_tab == 2, onClick: -> { mutate.active_tab 2 } ) {
            "Categories"
          }
        }
      }
    end

    def tab_content
      TabContent(activeTab: state.active_tab) {
        TabPane(tabId: 1) {
          heart_tab
        }
        TabPane(tabId: 2) {
          config_tab
        }
      }
    end

    def heart_tab
      BR()
      InputInplace(field: :name, model: params.probe, label: "Name",
        args: { placeholder: "Probe Name", type: :text}, edit_mode: state.edit_mode)

      InputInplace(field: :description, model: params.probe, label: "Description",
        args: { placeholder: "Description", type: :textarea }, edit_mode: state.edit_mode)

      H3 { "Happiness" }
      Row {
        Col {
          InputInplace(field: :happiness_goals, model: params.probe, label: "Goals",
            args: { placeholder: "Goals", type: :textarea }, edit_mode: state.edit_mode)
        }
      }
      BR()

      Row {
        Col {
          InputInplace(field: :happiness_signals, model: params.probe, label: "Signals",
            args: { placeholder: "Signals", type: :textarea }, edit_mode: state.edit_mode)
        }
        Col {
          InputInplace(field: :happiness_metrics, model: params.probe, label: "Metrics",
            args: { placeholder: "Metrics", type: :textarea }, edit_mode: state.edit_mode)
        }
      }

      # BR()
      # BR()
      #
      # H4 { "Enagement" }
      # H4 { "Adoption" }
      # H4 { "Retention" }
      # H4 { "Task Success" }

    end

    def config_tab
      BR()

      P { "Choose one or more categories in the HEART framework that are the focus of your product or project." }
      P { "Identifying clear goals will help choose the right metrics to help you measure progress." }
      P { "Map your goals to lower-level signals. There are usually a large number of potentially useful signals for a particular goal." }
      P { "Refine those signals into metrics you'll track over time or use in A/B testing. As in the previous step, there may be many possible metrics you could create from a given signal. It helps to have metrics that reflect the quality of the user experience, and that map to your main goals." }

      TABLE(class: 'table table-bordered') {
        THEAD {
          TR {
            TH { "Categories" }
            TH { "Goals" }
            TH { "Signals" }
            TH { "Metrics" }
          }
        }
        TBODY {
          TR {
            TD {
              SPAN { "Happiness - measures of user's attitudes."}
              SPAN(class: 'pull-right') {Button(size: :sm) {"Enabled"}}
            }
            TD { "a" }
            TD { "b" }
            TD { "c" }
          }
          TR {
            TD { "Engagement - level of user involvement." }
            TD { "b" }
            TD { "c" }
            TD { "d" }
          }
          TR {
            TD { "Adoption - gaining new users of a product or feature." }
            TD { "b" }
            TD { "c" }
            TD { "d" }
          }
          TR {
            TD { "Retention - rate at which existing users are returning." }
            TD { "b" }
            TD { "c" }
            TD { "d" }
          }
          TR {
            TD { "Task Success - efficiency, effectiveness, and error rate." }
            TD { "b" }
            TD { "c" }
            TD { "d" }
          }
        }
      }
    end

  end

end
