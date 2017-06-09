module Home
  class Page < Hyperloop::Component
    render(DIV) do
      DIV(class: 'container') {
        # TopBar()
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

  # class TopBar < Hyperloop::Component
  #   render(DIV) do
  #     NAV(class: 'navbar navbar-toggleable-sm fixed-top navbar bg-primary app-navbar') do
  #       # UL(class: 'nav navbar-nav') do
  #        A(class: 'nav-link', href: '/') { "Beat" }
  #       # end
  #     end
  #   end
  # end

  class Filters < Hyperloop::Component

    def new_card_button
      BUTTON(class: "btn btn-lg btn-danger") { "New Heart Card" }
    end

    def learn_button
      BUTTON(class: "btn btn-link btn-info") { "Learn about H.E.A.R.T" }
    end

    render do
      DIV(class: 'card') {
        DIV(class: 'card-block') {
          DIV(class: 'card-title') {
            H5 { "Welcome Christine" }
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
      5.times do
        Card()
        BR()
      end
    end
  end

  class Card < Hyperloop::Component

    def clicked
      alert "click"
    end

    render do
      DIV(class: 'card cursor-pointer') {
        DIV(class: 'card-block') {
          DIV(class: 'card-title') {
            H4(class: "card-title") { "In-place editing in Transact will be super awsome!" }
          }
          DIV(class: 'card-text') { "I am a Heart Card" }
        }
      }.on(:click) do
        clicked
      end
    end
  end

end
