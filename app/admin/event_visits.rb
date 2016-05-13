ActiveAdmin.register EventVisitSummary do
  actions :index

  index do
    selectable_column
    column :id
    column :name
    column :visit_count
    actions
  end
end
