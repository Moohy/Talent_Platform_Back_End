class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token

    before_action :configure_permitted_parameters, if: :devise_controller?


    respond_to :json, :html

    def render_resource(resource)
        if resource.errors.empty?
          render json: resource
        else
          validation_error(resource)
        end
      end
    
    def validation_error(resource)
      render json: {
        errors: [
          {
            status: '400',
            title: 'Bad Request',
            detail: resource.errors,
            code: '100'
          }
        ]
      }, status: :bad_request
    end

    protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end
end
