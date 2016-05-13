ActiveAdmin.register Olap do
  menu label: 'olap'
  actions :index

  config.filters = false

  index do
    selectable_column
    column :user
    column :payment
    column :event
    actions
  end
end
