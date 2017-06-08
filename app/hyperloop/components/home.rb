module Home
  class Page < Hyperloop::Component
    render(:div) do
      DIV(class: 'container') {
        TopBar()
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

  class TopBar < Hyperloop::Component
    render do
      NAV(class: 'navbar navbar-toggleable-sm fixed-top navbar bg-primary app-navbar') {
        # A(class: 'navbar-brand', href: '#') { "Beat" }
      }
    end
  end

  class Filters < Hyperloop::Component
    render do
      DIV {
        "Some Filters"
      }
    end
  end

  class Cards < Hyperloop::Component
    render do
      DIV {
        "And some cards"
      }
    end
  end

end
