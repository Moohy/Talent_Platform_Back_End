class Api::V1::RatingController < ApiController
    
    def show
        @rate = Rate.all
    end
    
    def update
        rate = Rate.find(params[:id])
        rate.update(params.require(:rate).permit(:comment, :rate))
        redirect_to rate
    end
    
    def destroy
        rate.find(params[:id]).destroy
        redirect_to index_path
    end

end
