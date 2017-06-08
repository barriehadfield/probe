module Home
  class Page < Hyperloop::Component
    render(:div) do
      DIV(class: 'container') do
        TopBar()
        BR()
        DIV(class: 'row') do
          DIV(class: 'col-md-3') do
            Filters()
          end
          DIV(class: 'col-md-9') do
            Cards()
          end
        end
      end
    end
  end

  class TopBar < Hyperloop::Component
    render do
      NAV(class: 'navbar navbar-toggleable-sm fixed-top navbar bg-primary app-navbar') do
        A(class: 'navbar-brand', href: '/') { "Beat" }
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
        DIV(class: 'card') do
          DIV(class: 'card-block') { "I am a Heart Card" }
        end
        BR()
      end
    end
  end

end
