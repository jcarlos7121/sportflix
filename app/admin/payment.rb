ActiveAdmin.register Payment do
  permit_params :user_id, :month_reference, :payment_date, :payment_type, :cost

  member_action :pay_month, method: :post do
    Payment.transaction do
      resource.update payment_date: Time.zone.now
    end

    redirect_to :back
  end

  index do
    selectable_column
    id_column
    column :user
    column :month_reference do |r|
      r.month_reference
    end
    column :payment_date do |r|
      r.payment_date
    end
    column :cost
    actions defaults: true do |payment|
      link_to(
        'Pagar',
        pay_month_admin_payment_path(payment),
        method: :post,
        data: { confirm: 'Seguro que quieres pagar?'}
      ) unless payment.payment_date
    end
  end

  form do |f|
    f.inputs "Detalles de Tarjeta" do
      f.input :user
      f.input :month_reference, as: :datepicker
      f.input :payment_date, as: :datepicker
      f.input :payment_type
      f.input :cost
    end
    f.actions
  end
end
