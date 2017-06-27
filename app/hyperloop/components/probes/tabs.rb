module Probes

  class ProbeTabs < Hyperloop::Component
    render do
      # Mui.Tabs {
      #   Mui.Tab(label: "First") { P {"first"} }
      #   Mui.Tab(label: "Next") { P {"next"} }
      # }
    end
  end

  # class ProbeTabs < Hyperloop::Component
  #
  #   param :probe
  #   param :edit_mode
  #
  #   before_mount do
  #     mutate.active_tab 1
  #   end
  #
  #   render(DIV) do
  #     tabs
  #     tab_content
  #   end
  #
  #   def tabs
  #     Nav(tabs: true) {
  #       NavItem {
  #         NavLink( class: 'cursor-pointer', active: state.active_tab == 1, onClick: -> { mutate.active_tab 1 } ) {
  #           "HEART"
  #         }
  #       }
  #       NavItem {
  #         NavLink( class: 'cursor-pointer', active: state.active_tab == 2, onClick: -> { mutate.active_tab 2 } ) {
  #           "Categories"
  #         }
  #       }
  #     }
  #   end
  #
  #   def tab_content
  #     TabContent(activeTab: state.active_tab) {
  #       TabPane(tabId: 1) {
  #         HeartTab(probe: params.probe, edit_mode: params.edit_mode)
  #       }
  #       TabPane(tabId: 2) {
  #         ConfigTab(probe: params.probe, edit_mode: params.edit_mode)
  #       }
  #     }
  #   end
  #
  # end
end
