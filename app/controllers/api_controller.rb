class ApiController < ActionController::API

    def is_loggedin
        render json: !!current_user
    end

    def user_type
        if current_user
            render json: {user: current_user, user_type: current_user.role.title}
        else
            render json: "not logged in"
        end
    end

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
end