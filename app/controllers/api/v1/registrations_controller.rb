class Api::V1::RegistrationsController < Devise::RegistrationsController
    clear_respond_to 
    respond_to :json
  
    def create
      build_resource(sign_up_params)
      resource.role = Role.where(id: params[:role_id])[0]
      resource.save
      render_resource(resource)
    end

    # private
    # def sign_up_params
    #     params.require(:user).permit(:email, :username, :password)
    # end
  end