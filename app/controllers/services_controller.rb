class ServicesController < ApplicationController

  def index
    @services = Service.all
    render json: @services
  end  

  def show
    @service = Service.find(params[:id])
    render json: @service
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    # @service.update(params.require(:service)
    if @service.update(service_params)
      render json: 'Service has been Updated !'
      
    else
      render json: 'Service has not Updated'
    end
  end

  def create
    @service = Service.new(service_params)


  if @service.save
    render json: 'Service has been Created !'
    
  else
    render json: 'service isnt Created'
  end

  end

  def destroy
    @service = Service.find(params[:id])
    if @service.present?
      @service.destroy
      render json: 'Service has been Deleted !'
      
    end
    
  end


  private

  def service_params
    params.require(:service).permit( :price_range, :location, :description)
    end
end
