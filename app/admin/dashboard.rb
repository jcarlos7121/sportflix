ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span 'Ventas totales del mes'
        small ActiveRecord::Base.connection.execute("SELECT getVentas(5) FROM dual").fetch.first.to_i
      end
      span class: "blank_slate" do
        span 'Vistas totales del mes'
        small ActiveRecord::Base.connection.execute("SELECT getViews(5) FROM dual").fetch.first.to_i
      end
    end
  end # content
end
