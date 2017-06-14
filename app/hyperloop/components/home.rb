class Bs < React::NativeLibrary
  imports 'ReactBootstrap'
end


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
      BUTTON(class: "btn btn-danger") { "New Heart Card" }.on(:click) do
        mutate.show true
      end
    end

    def learn_button
      BUTTON(class: "btn btn-success") { "Learn about H.E.A.R.T" }
      # BUTTON(type: "button", class:"btn btn-primary", data_toggle: "modal", data_target: ".bd-example-modal-sm")  {"Small modal"}
      ReactBootstrap.Button(bsStyle: 'success') { 'Save' }.on(:click) {  }
    end

    before_mount do
      mutate.show false
    end

    def close
      puts "close"
      mutate.show false
    end

    # def modal
    #   DIV {
    #     Modal.Modal(show: state.show, backdrop: true, onHide: lambda { close }) {
    #       Modal.Modal.Header {
    #         # Modal.Modal.Title(id: 'ModalHeader') { "Here is the title " }
    #         H4 { "Header" }
    #       }
    #       Modal.Modal.Body { P { "Body" } }
    #       # Modal.Footer {
    #       #   Modal.Modal.Dismiss(className: 'btn btn-default') { "Cancel"}
    #       # }
    #     }
    #   }
    # end

    def modal
      DIV {
        Bs.Modal(show: state.show, dialogClassName: "modal-xl", onHide: lambda { close }) {
          Bs.ModalHeader {
            # Modal.Modal.Title(id: 'ModalHeader') { "Here is the title " }
            H4 { "Header" }
          }
          Bs.ModalBody { P { "Body" } }
          # Modal.Footer {
          #   Modal.Modal.Dismiss(className: 'btn btn-default') { "Cancel"}
          # }
        }
      }
    end

    def clicked
      puts "click"
      mutate.show true
    end

    render(DIV) do
      modal
      DIV(class: 'card') {
        DIV(class: 'card-block') {
          DIV(class: 'card-title') {
            H5 { "Welcome Christine" }
            P { "Lots of new things have happened since you were last here." }
          }
          DIV(class: 'text-center') {
            new_card_button
            learn_button
            # Bs.Modal(show: true) {
            #     Bs.ModalHeader { DIV { P {"header"}} }
            #     Bs.ModalBody { DIV { P {"Body"} } }
            # }
          }
        }
      }
    end
  end

  class Cards < Hyperloop::Component
    render(DIV) do
      1.times do
        Card()
        BR()
      end
    end
  end

  class Card < Hyperloop::Component

    # before_mount do
    #   mutate.show false
    #   # @modal = Bs.Modal
    #   # @button = Bs.Button({
    #   #   bsStyle: "success",
    #   #   bsSize: "large",
    #   #   children: "Changes"
    #   # })
    # end
    #
    # def close
    #   puts "close"
    #   mutate.show false
    # end
    #
    # def modal
    #   Bs.Modal(show: state.show, animation: false, onHide: lambda { close }) {
    #     Bs.ModalHeader {  H4 { "header" }  }
    #     Bs.ModalBody { DIV { P { "Body" } } }
    #   }
    # end
    #
    # def clicked
    #   puts "click"
    #   mutate.show true
    # end

    render(DIV) do
      # modal
      DIV(class: 'card cursor-pointer') {
        DIV(class: 'card-block') {
          DIV(class: 'card-title') {
            H4(class: "card-title") { "In-place editing in Transact will be super awsome!" }
          }
          DIV(class: 'card-text') { "I am a Heart Card" }
          # @button.render
        }
      }.on(:click) do
        # clicked
        # modal
      end
      # @modal.render
      # modal
    end
  end

end
