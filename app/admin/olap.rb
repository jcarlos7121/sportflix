ActiveAdmin.register Olap do
  menu label: 'olap'
  actions :index

  index do
    selectable_column
    column :user
    column :payment
    column :user_event
    actions
  end
end
