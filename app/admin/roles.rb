ActiveAdmin.register Role do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title
  #
  # or
  #
  # permit_params do
  #   permitted = [:title]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # form do |f|
  #   f.input :user, as: :check_boxes, :collection => User.all.map{ |u|  [u.id, u.username] }
  #   f.actions
  # end
  
end
