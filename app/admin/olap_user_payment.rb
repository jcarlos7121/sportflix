ActiveAdmin.register OlapUserPayment do
  menu label: 'User payments'
  actions :index

  config.filters = false

  index do
    selectable_column
    column :user
    column :total_payment
    actions
  end
end
