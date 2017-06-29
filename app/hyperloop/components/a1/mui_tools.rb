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

  def rate_card
    #  Grid
    Grid {
      Row {
        Col { "I am a cell" }
      }
    }

    # Button
    Mui.Button(onClick: -> { alert("click click") } ) { "Button to click" }
    Mui.Button(color: :primary ) { "Primary Button" }
    Mui.Button(color: :accent ) { "Accent Button" }
    Mui.Button(color: :accent, raised: true ) { "Accent Raised Button" }
    Mui.Button(color: :primary, raised: true, fab: true ) { "+" }
    BR()

    # Icon
    DIV(class: 'i fa fa-star')
    Mui.Icon { DIV(class: 'i fa fa-star') }

    #  Icon menu
    # button = Mui.IconButton(iconClassName: 'i fa fa-cog').as_node
    # Mui.IconMenu(iconButtonElement: button.to_n ) {
    #   Mui.MenuItem { "Have me" }
    #   Mui.MenuItem { "Or me" }
    #   Mui.MenuItem { "Please take me" }
    # }

    #  Paper
    style = {
        height: 100,
        width: 300,
        margin: 20,
        textAlign: 'center',
        display: 'inline-block'
    }
    Mui.Paper(style: style) { P {"Hello there"} }

    # floating action button
    # Mui.FloatingActionButton { Mui.FontIcon(className: 'i fa fa-plus') }

    #  Divider
    Mui.Divider()

    # Checkbox
    mutate.check true if state.check.nil?
    Mui.Checkbox()
    Mui.LabelCheckbox(label: "I am a checkbox", checked: state.check ).on(:change) {
      mutate.check !state.check
    }

    #  switch
    Mui.Switch(checked: state.check ).on(:change) {
      mutate.check !state.check
    }

  end


end
