ActiveAdmin.register New do
  permit_params :title, :text, :date_publish, :admin_user_id

  index do
    selectable_column
    id_column
    column :title
    column :date_publish do |resource|
      resource.date_publish
    end
    column :admin_user
    actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :title
      f.input :text
      f.input :date_publish, as: :datepicker
      f.input :admin_user
    end
    f.actions
  end
end
