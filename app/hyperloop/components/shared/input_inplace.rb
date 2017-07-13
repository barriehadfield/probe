class InputInplace < Hyperloop::Component

  include MuiTools

  param :field
  param :model
  param :edit_mode
  param :placeholder
  param :label

  param args: {}

  render do
   if params.edit_mode
     Mui.TextField(value: params.model[params.field.to_s].to_s, label: params.label,
     style: { width: '100%' },
     placeholder: params.placeholder.to_s).on(:change) do |e|
       params.model[params.field.to_s] = e.target.value
     end
   else
    #  Label { params.label } if params.label
     Body1 { params.model.send(params.field) } if params.model.send(params.field)
   end
 end

end
