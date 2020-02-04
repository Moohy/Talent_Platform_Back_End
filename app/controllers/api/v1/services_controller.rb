class Api::V1::ServicesController < ApiController
  load_and_authorize_resource
  # load_and_authorize_resource :offer
  # load_and_authorize_resource :offer, through: :offer

  def index
    @services = Service.all
    @services_hash = @services.map do |s|
      {service: s, user: s.user.username, galleries: s.galleries, categories: s.categories}
    end
    render json: @services_hash
  end  

  def user_services
    @services = Service.where(user: current_user)
    @services_hash = @services.map do |s|
      {service: s, user: s.user.username, galleries: s.galleries, categories: s.categories, offers: s.offers}
    end
    render json: @services_hash
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
      render json: 'Service has been Updated!'
      
    else
      render json: 'Service has not Updated'
    end
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
  if @service.save
    params[:categories].each do |categories|
      categories = CategoryService.new(:category_id => categories, :service_id => @service.id)
      if categories.valid?
        categories.save
      else
        @errors += categories.errors
      end
    end

    params[:galleries].each do |galleries|
      galleries = Gallery.new(url: galleries, service_id: @service.id)
      if galleries.valid?
        galleries.save
      else
        @errors += galleries.errors
      end
    end
    render json: 'Service and Categories and Galleries have been Created!'  
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
    params.require(:service).permit(:price_range, :location, :description, :name)
    end
end
