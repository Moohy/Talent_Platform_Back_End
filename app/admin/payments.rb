ActiveAdmin.register Payment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :price, :time, :receipt, :offer_id, :user_id, :status

  index do
    selectable_column
    id_column
    column :price
    column :time
    column :status
    column :offer_id
    column :user_id
    actions
  end

  show do |p|
    if p.receipt.attached? && p.receipt.attached?
      attributes_table do
        row :price
        row :time
        row :status
        row :offer_id
        row :user_id
        row "receipt" do |r|
          span do
              image_tag(r.receipt)
          end
        end
      end
    else
      attributes_table do
        row :price
        row :time
        row :status
        row :offer_id
        row :user_id
      end
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:price, :time, :reciept_url, :offer_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
