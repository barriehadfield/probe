# module Shared
  module MuiTools

    def Display1
      SPAN(class: 'mdc-typography--display1') { yield }
    end

    def SubHeading1
      SPAN(class: 'mdc-typography--subheading1') { yield }
    end

  end

# end
