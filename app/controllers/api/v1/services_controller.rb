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
    json_res = {}
    if @service.update(service_params)
      if service_params[:galleries_attributes]
        galleries_urls_in_params = service_params[:galleries_attributes].map {|gallery| gallery["url"]}

        galleries_to_be_deleted = @service.galleries.map do |gallery|
          gallery unless galleries_urls_in_params.include? gallery.url
        end
        Gallery.delete(galleries_to_be_deleted) if galleries_to_be_deleted.any?
      end

      if service_params[:category_services_attributes]
        categories_ids_in_params = service_params[:category_services_attributes].map {|category| category["category_id"]}
        
        categories_to_be_deleted = @service.category_services.map do |category|
          category unless categories_ids_in_params.include? category.category_id
        end
        CategoryService.delete(categories_to_be_deleted) if categories_to_be_deleted.any?
     end

      json_res.merge! service: @service
      render json: json_res, errors: @errors
    else
      @errors += @service.errors
      render json: @errors
    end
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    @errors = []
  if @service.save
    # Category.delete()
    # params[:categories].each do |categories|
    #   categories = CategoryService.new(:category_id => categories, :service_id => @service.id)
    #   if categories.valid?
    #     categories.save
    #   else
    #     @errors += categories.errors
    #   end
    # end

    # params[:galleries].each do |galleries|
    #   galleries = Gallery.new(url: galleries, service_id: @service.id)
    #   if galleries.valid?
    #     galleries.save
    #   else
    #     @errors += galleries.errors
    #   end
    # end
    render json: 'Service and Categories and Galleries have been Created!'  
  else
    render json: {errors: @service.errors}
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
    params.require(:service).permit(:price_range, :location, :description, :name, galleries_attributes: [:url], category_services_attributes: [:category_id] )
    end
end
