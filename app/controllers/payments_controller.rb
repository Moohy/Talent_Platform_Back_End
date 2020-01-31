class PaymentsController < ApplicationController

    def index
        @payments = Payment.all
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
        if @payment.save
          render json: [@payment, message: 'payment was successfully created.']
        else
          render json: "dsmjfhfk"
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
          params.require(:payment).permit(:price, :time, :reciept_url,:status)
        end


    
    
    
    
end
