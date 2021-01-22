ActiveAdmin.register Category do
permit_params :title, :parent_id

  index do
    selectable_column
    id_column
    column :title
    actions
  end

  show do
    category
  end

  filter :title
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :parent_id
    end
    f.actions
  end
end
