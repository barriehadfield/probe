# below apparently work... (chat)
# import { createMuiTheme } from 'material-ui/styles';
# import createPalette from 'material-ui/styles/palette';
# import { blue, green } from 'material-ui/styles/colors';
#
# const muiTheme = createMuiTheme({
#   palette: createPalette({
#     primary: blue,
#     accent: {
#       ...green,
#       A200: '#4CAF50',
#       A400: '#388E3C'
#     }
#   }),
#   overrides: {
#     MuiFormLabel: {
#       focused: {
#         color: '#333333'
#       }
#     }
#   }
# });


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

  def Headline params = {}
    if params[:element] == :span
      SPAN(class: 'mdc-typography--headline') { yield }
    else
      DIV(class: 'mdc-typography--headline') { yield }
    end
  end

  def Title
    if params[:element] == :span
      SPAN(class: 'mdc-typography--title') { yield }
    else
      DIV(class: 'mdc-typography--title') { yield }
    end
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

  def Label
    DIV(class: 'mdc-typography--caption MuiFormLabel MuiInputLabel MuiInputLabel-formControl') { yield }

  end

  def input_style
    { width: '100%' }
  end

  def font_card

      Display1 { "Display1" }
      Display2 { "Display2" }
      Display3 { "Display3" }
      Display4 { "Display4" }
      Headline { "Headline" }
      Title { "Title" }
      SubHeading1 { "SubHeading1" }
      SubHeading2 { "SubHeading2" }
      Body1 { "Body1" }
      Body2 { "Body2" }
      Caption { "Caption" }
      BR()
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

    Mui.Divider()
    #  input

    mutate.value "" if state.value.nil?
    # H1 { state.value }
    # Mui.TextField(onChange: lambda { |event| puts event.target.value })

    H1 { state.value }

    # mutate.value  @value
    Mui.TextField(label: "Full name", placeholder: "First name and last name", style: {width: '100%'})
    BR()
    Mui.TextField(label: "Dogs name").on(:change) do |e|
      # @value = e.target.value
      mutate.value e.target.value
    end

    # Body1 { state.value }
    # Mui.TextField(value: state.value).on(:change) do |event|
    #   mutate.value event.target.value
    # end

  end


end
