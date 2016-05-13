ActiveAdmin.register Card do
  permit_params :user_id, :cvv, :expiration_date, :card_number

  index do
    selectable_column
    id_column
    column :invoiced_ammount
    column :user
    column :cvv
    column :expiration_date
    column :card_number
    actions
  end

  form do |f|
    f.inputs "Detalles de Tarjeta" do
      f.input :user
      f.input :cvv
      f.input :expiration_date, as: :datepicker
      f.input :card_number
    end
    f.actions
  end
end
