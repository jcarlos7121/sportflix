ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :current_sign_in_at
  filter :name
  filter :email
  filter :created_at

  index do
    selectable_column
    id_column
    column :name
    column :email
    actions
  end

  form do |f|
    f.inputs "Detalles del Usuario" do
      f.input :name
      f.input :email
      f.input :current_sign_in_at, as: :datepicker
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
