class Api::V1::OffersController < ApiController
    # load_and_authorize_resource :user, 
    load_and_authorize_resource :service 
    load_and_authorize_resource  :offer, through: :service, :except => [:user_offers, :accept, :decline]

    def index
        @offers = Offer.where(service_id: params[:service_id])
        render json: @offers
    end

    def user_offers
        if current_user.role? "buyer"
            @offers = Offer.where(user: current_user)
            @offers_hash = @offers.map do |offer|
            {offer: offer, user: offer.user.username, service: offer.service, service_galleries: offer.service.galleries, payments: offer.payments}
            end
            render json: @offers_hash
        else
            render json: {message: "login please"}
        end
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
        @offer.status = "pending"
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

    def accept
        authorize! :accept, Offer
        @offer = Offer.find(params[:offer_id])
        if @offer.update(status: "accepted")
         render json: @offer
        end
    end

    def decline
        authorize! :decline, Offer
        @offer = Offer.find(params[:offer_id])
        if @offer.update(status: "declined")
         render json: @offer
        end
    end

    def set_offer
        @offer = Offer.find(params[:id])
    end

    def offer_params
        params.require(:offer).permit(:price,:time,:location,:description)
    end
end
