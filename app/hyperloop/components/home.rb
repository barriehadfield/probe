module Home
  class Page < Hyperloop::Component
    render(:div) do
      div(class: 'container') {
        div(class: 'row') {
          div(class: 'col-md-3') {
            "Filters"
          }
          div(class: 'col-md-9') {
            "Cards" 
          }
        }
      }
    end
  end
end
