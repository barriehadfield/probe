module Home
  class Page < Hyperloop::Component
    render(DIV) do
      DIV(class: 'container') {
        BR()
        DIV(class: 'row') {
          DIV(class: 'col-md-3') {
            Filters()
          }
          DIV(class: 'col-md-9') {
            Cards()
          }
        }
      }
    end
  end

  class Filters < Hyperloop::Component

    def new_card_button
      BUTTON(class: "btn btn-danger") { "New Heart Card" }.on(:click) do
        # mutate.show true
      end
    end

    def learn_button
      BUTTON(class: "btn btn-success") { "Learn about H.E.A.R.T" }
      ReactBootstrap.Button(bsStyle: 'success') { 'Save' }.on(:click) {  }
    end

    render(DIV) do
      DIV(class: 'card shadow') {
        DIV(class: 'card-block') {
          DIV(class: 'card-title') {
            H5 {
              "Welcome Christine"
            }
            P { "Lots of new things have happened since you were last here." }
          }
          DIV(class: 'text-center') {
            new_card_button
            learn_button
          }
        }
      }
    end
  end

  class Cards < Hyperloop::Component
    render(DIV) do
      Probe.all.each do |probe|
        Probes::Item(probe: probe)
        BR()
      end
    end
  end

end
