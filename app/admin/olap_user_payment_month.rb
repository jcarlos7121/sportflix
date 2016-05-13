ActiveAdmin.register OlapUserPaymentMonth do
  menu label: 'User payments per month'
  actions :index

  config.filters = false

  index do
    selectable_column
    column :user
    column :total_payment
    column :payment_month do |l|
      l.payment_month
    end
    actions
  end
end
