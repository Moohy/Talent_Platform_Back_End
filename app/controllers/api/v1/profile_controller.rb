class Api::V1::ProfileController < ApiController
    
    def show
        @profile = Profile.find(params[:id])
        render json: @profile
    end

    def update
        profile = Profile.find(params[:id])
        profile.update(params.require(:profile).permit(:first_name, :last_name, :location, :image, :about_me))
        redirect_to profile
    end

    def destroy
        Profile.find(params[:id]).destroy
        redirect_to index_path
    end

end