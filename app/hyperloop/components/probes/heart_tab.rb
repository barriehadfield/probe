module Probes
  class HeartTab < Hyperloop::Component

    param :probe
    param :edit_mode

    render(DIV) do
      heart_tab
    end

    def heart_tab
      BR()
      InputInplace(field: :name, model: params.probe, label: "Name",
        args: { placeholder: "Probe Name", type: :text}, edit_mode: params.edit_mode)

      InputInplace(field: :description, model: params.probe, label: "Description",
        args: { placeholder: "Description", type: :textarea }, edit_mode: params.edit_mode)

      H3 { "Happiness" }
      Row {
        Col {
          InputInplace(field: :happiness_goals, model: params.probe, label: "Goals",
            args: { placeholder: "Goals", type: :textarea }, edit_mode: params.edit_mode)
        }
      }
      BR()

      Row {
        Col {
          InputInplace(field: :happiness_signals, model: params.probe, label: "Signals",
            args: { placeholder: "Signals", type: :textarea }, edit_mode: params.edit_mode)
        }
        Col {
          InputInplace(field: :happiness_metrics, model: params.probe, label: "Metrics",
            args: { placeholder: "Metrics", type: :textarea }, edit_mode: params.edit_mode)
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


  end
end
