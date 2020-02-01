class Api::V1::OffersController < ApiController
    load_and_authorize_resource :service 
    # load_and_authorize_resource through: :service

    def index
        @offers = Offer.where(service_id: params[:service_id])
        render json: @offers
    end
    
    def new
        @offer = Offer.new
    end
    
    def show
        @offer = Offer.find(params[:id])
        render json: @offer
    end

    def create
        @offer = Offer.new(offer_params)
        @offer.user = current_user
        @offer.service_id = params[:service_id]
        if @offer.save
            render json: [@offer, message: 'Offer was successfully created.']
        else
            render json: [@offer.errors, message: 'Offer was not created.']
        end
    end
    

    def destroy
        @offer = Offer.find(params[:id])
        if @offer.present?
            @offer.destroy
            render json:  [message: 'Offer was successfully destroyed.']
        end
    end

    def update
          if @offer.update(offer_params)
           redirect_to @offer, notice: 'Offer was successfully updated.'
          end
    end

    def set_offer
        @offer = Offer.find(params[:id])
    end

    def offer_params
        params.require(:offer).permit(:price,:time,:location,:description)
    end
end
