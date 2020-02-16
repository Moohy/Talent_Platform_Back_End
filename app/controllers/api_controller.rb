class ApiController < ActionController::API

    rescue_from CanCan::AccessDenied do |exception|
        render json: {errors:exception.message}

    end

    def is_loggedin        
        return render json: {user: current_user, user_type: current_user.role.title, status: !!current_user} if current_user
        render json: {status: !!current_user}
    end

    def user_type
        if current_user
            render json: {user: current_user, user_type: current_user.role.title}
        else
            render json: {status: !!current_user}
        end
    end

 
end