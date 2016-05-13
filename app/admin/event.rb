ActiveAdmin.register Event do
  permit_params :category_id, :name, :event_type, :event_time, :url_service

  form do |f|
    f.inputs "Detalles de Tarjeta" do
      f.input :category
      f.input :name
      f.input :event_time, as: :datepicker
      f.input :url_service
    end
    f.actions
  end
end
