class Api::V1::Admin::RolesController < ApiController
    before_action :set_role, only: [:edit, :update, :destroy]
      def index
        @roles = Role.all
        render json: @roles
      end
    
      def create
        @role = Role.new(roles_params)
        if @role.save
            render json: [@role, message: 'Role successfully created!']
        else
            render json: [message: 'Role never created!']
        end
      end
    
      def update
        if @role.update(roles_params)
            render json: [message: 'Role successfully updated!']
        else
            render json: [message: 'Role never updated!']
        end

      end
    
      def edit
        
      end
    
      def destroy
        @role = Role.find(params[:id])
        if @role
            @role.destroy
            render json: [message: 'Role successfully deleted!']
        end
        
      end

      private

        def roles_params
            params.require(:role).permit(:title)
        end

        def set_role
            @role = Role.find(params[:id])
        end
end
