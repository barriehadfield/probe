class SafeTimeAgo < Hyperloop::Component
  param :date
  render(SPAN) do
    case
    when params.date.nil? || params.date == 0 || params.date.to_i == 978307200
      "Never"
    else
      TimeAgo(date: params.date.to_n)
    end
  end
end

class InputInplace < Hyperloop::Component
  param :field
  param :model
  param :edit_mode

  param label: nil
  param args: {}

  render(DIV) do
   if params.edit_mode
     Label { params.label } if params.label
     Input( { defaultValue: params.model.send(params.field) }.merge(params.args) ).on(:change) do |e|
       params.model[params.field.to_s] = e.target.value
     end
   else
     Label { params.label } if params.label
     P { params.model.send(params.field) }
   end
 end
end
