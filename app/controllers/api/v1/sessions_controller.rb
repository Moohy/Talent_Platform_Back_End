class Api::V1::SessionsController < Devise::SessionsController
    respond_to :json
  
  
    private

    def respond_with(resource, _opts = {})
    # puts _opts
      # return render json: {errors: resource.errors} unless resource.errors.nil?
      render json: {user: resource, user_type: resource.role, token: current_token}
    end
  
    def respond_to_on_destroy
      head :no_content
    end


    def current_token
      request.env['warden-jwt_auth.token']
    end
  end