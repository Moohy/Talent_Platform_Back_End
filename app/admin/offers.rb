ActiveAdmin.register Offer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :price, :time, :location, :description, :user_id, :service_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:price, :time, :location, :description, :user_id, :service_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
