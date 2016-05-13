ActiveAdmin.register UserEvent do
  permit_params :user_id, :event_id, :timestamp

  form do |f|
    f.inputs "Detalles de Tarjeta" do
      f.input :user
      f.input :event
      f.input :timestamp, as: :datepicker
    end
    f.actions
  end
end
