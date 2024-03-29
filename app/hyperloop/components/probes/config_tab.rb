module Probes
  class ConfigTab < Hyperloop::Component

    param :probe
    param :edit_mode

    render(DIV) do
      config_tab
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
