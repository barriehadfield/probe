class Categorie < Hyperloop::Component

  param :edit_mode
  param :probe

  render(DIV) do
    InputInplace(field: :happiness_goals, model: params.probe, label: "Goals",
      placeholder: "What are you trying to achieve?", edit_mode: params.edit_mode)
    Mui.Divider(light: true)

    InputInplace(field: :happiness_signals, model: params.probe, label: "Signals",
      placeholder: "Name the signals you expect to see", edit_mode: params.edit_mode)
    Mui.Divider(light: true)

    InputInplace(field: :happiness_metrics, model: params.probe, label: "Metrics",
      placeholder: "And now time for the metrics", edit_mode: params.edit_mode)
    Mui.Divider(light: true)
  end

end
