ActiveAdmin.register Service do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :price_range, :location, :description, :user_id, :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:price_range, :location, :description, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
