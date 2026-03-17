ActiveAdmin.register User do
  permit_params :email

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  filter :email
  filter :created_at
end