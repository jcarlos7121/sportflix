ActiveAdmin.register UserEvent do
  actions :index, :new, :create
  permit_params :user_id, :event_id, :timestamp

  index do
    selectable_column
    column :user
    column :event
    actions
  end

  form do |f|
    f.inputs "Detalles de Tarjeta" do
      f.input :user
      f.input :event
      f.input :timestamp, as: :datepicker
    end
    f.actions
  end
end
