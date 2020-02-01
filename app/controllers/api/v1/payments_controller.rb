class Api::V1::PaymentsController < ApiController
  load_and_authorize_resource :offer 
  
    def index
        @payments = Payment.where(offer_id: params[:offer_id])
        render json: @payments
    end

    def show
      @payment = Payment.find(params[:id])
    end

    def new
     @payment = Payment.new
    end

    def create
        @payment = Payment.new(payment_params)
        @payment.offer_id = params[:offer_id]
        @payment.user_id = current_user.id
        @payment.status = "pending"
        if @payment.save
          render json: [@payment, message: 'payment was successfully created.']
        else
          render json: [@payment.errors, message: 'payment was not created.']
        end
    end
    
    def edit
        
    end

    def update
        respond_to do |format|
          if @payment.update(payment_params)
           redirect_to @payment, notice: 'Payment was successfully updated.'
          end
    end
  end
    
      def destroy
        @payment.destroy
         redirect_to payments_url, notice: 'Payment was successfully destroyed.'
      end
    
      private
    
        def set_payment
          @payment = Payment.find(params[:id])
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def payment_params
          params.require(:payment).permit(:price, :time, :reciept_url)
        end


    
    
    
    
end
