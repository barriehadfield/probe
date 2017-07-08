class Categorie < Hyperloop::Component

  param :edit_mode
  param :probe
  param :categorie

  render(DIV) do
    InputInplace(field: "#{params.categorie}_goals", model: params.probe, label: "Goals",
      placeholder: "What are you trying to achieve?", edit_mode: params.edit_mode)
    Mui.Divider(light: true)
    BR()

    InputInplace(field: "#{params.categorie}_signals", model: params.probe, label: "Signals",
      placeholder: "Name the signals you expect to see", edit_mode: params.edit_mode)
    Mui.Divider(light: true)
    BR()

    InputInplace(field: "#{params.categorie}_metrics", model: params.probe, label: "Metrics",
      placeholder: "And now time for the metrics", edit_mode: params.edit_mode)
    Mui.Divider(light: true)
    BR()
  end

end
