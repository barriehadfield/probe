module MuiTools

  def Display1
    DIV(class: 'mdc-typography--display1') { yield }
  end

  def Display2
    DIV(class: 'mdc-typography--display2') { yield }
  end

  def Display3
    DIV(class: 'mdc-typography--display3') { yield }
  end

  def Display4
    DIV(class: 'mdc-typography--display4') { yield }
  end

  def Headline
    DIV(class: 'mdc-typography--headline') { yield }
  end

  def Title
    DIV(class: 'mdc-typography--title') { yield }
  end

  def SubHeading1
    DIV(class: 'mdc-typography--subheading1') { yield }
  end

  def SubHeading2
    DIV(class: 'mdc-typography--subheading2') { yield }
  end

  def Body1
    DIV(class: 'mdc-typography--body1') { yield }
  end

  def Body2
    DIV(class: 'mdc-typography--body2') { yield }
  end

  def Caption
    DIV(class: 'mdc-typography--caption') { yield }
  end

  def font_card
    Grid(fluid: true) {
      Row { Col { Display1 { "Display1" } } }
      Row { Col { Display2 { "Display2" } } }
      Row { Col { Display3 { "Display3" } } }
      Row { Col { Display4 { "Display4" } } }
      Row { Col { Headline { "Headline" } } }
      Row { Col { Title { "Title" } } }
      Row { Col { SubHeading1 { "SubHeading1" } } }
      Row { Col { SubHeading2 { "SubHeading2" } } }
      Row { Col { Body1 { "Body1" } } }
      Row { Col { Body2 { "Body2" } } }
      Row { Col { Caption { "Caption" } } }
      BR()
    }
  end

end
