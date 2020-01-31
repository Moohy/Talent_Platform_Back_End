class OffersController < ApplicationController


    def index
        @offers = Offer.all
        render json: @offers
    end
    
    def new
        @offer = Offer.new
    end
    
    def show
        @offer = Offer.find(params[:id])
    end

    def create
        @offer = Offer.new(offer_params)
          if @offer.save
            render json: [@offer, message: 'Offer was successfully created.']
          else
        end
    end
    

    def destroy
        Offer.find(params[:id]).destroy
        redirect_to offers_url , notice: 'Offer was successfully destroyed.'
    end

    def update
        respond_to do |format|
          if @offer.update(offer_params)
           redirect_to @offer, notice: 'Offer was successfully updated.'
          end
        end
      end

    def set_offer
        @offer = Offer.find(params[:id])
    end

    def offer_params
        params.require(:offer).permit(:price,:time,:location,:description)
    end
    
    
    
    
    

end
