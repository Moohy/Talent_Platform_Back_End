ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :username, :confirmed_at

  index do
    selectable_column
    id_column
    column :email
    column :username
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :username

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :username
      f.input :confirmed_at
    end
    f.actions
  end

end
