module Home
  class Page < Hyperloop::Component
    render(DIV) do
      DIV(class: 'container') do
        TopBar()
        BR()
        DIV(class: 'row') do
          DIV(class: 'col-md-2') do
            Filters()
          end
          DIV(class: 'col-md-10') do
            Cards()
          end
        end
      end
    end
  end

  class TopBar < Hyperloop::Component
    render(DIV) do
      NAV(class: 'navbar navbar-toggleable-sm fixed-top navbar bg-primary app-navbar') do
        # UL(class: 'nav navbar-nav') do
         A(class: 'nav-link', href: '/') { "Beat" } 
        # end
      end
    end
  end

  class Filters < Hyperloop::Component
    render do
      DIV { "Some Filters" }
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
      DIV(class: 'card cursor-pointer') do
        DIV(class: 'card-block') do
          DIV(class: 'card-title') do
            H4(class: "card-title") { "In-place editing in Transact will be super awsome!" }
          end
          DIV(class: 'card-text') { "I am a Heart Card" }
        end
      end.on(:click) do
        clicked
      end
    end
  end

end
