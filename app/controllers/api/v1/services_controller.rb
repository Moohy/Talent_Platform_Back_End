class Api::V1::ServicesController < ApiController
  load_and_authorize_resource
  # load_and_authorize_resource :offer
  # load_and_authorize_resource :offer, through: :offer

  def index
    @services = Service.all
    @services_hash = @services.map do |s|
      {service: s, medium: s.medium.map { |media|
        media.as_json.merge({ media: url_for(media) })
      }, user: s.user.username, categories: s.categories}#, galleries: s.galleries
      
    end
    render json: @services_hash
  end  

  def user_services
    @services = Service.where(user: current_user)
    @services_hash = @services.map do |s|
      {service:s, medium: s.medium.map { |media|
      media.as_json.merge({ media: url_for(media) })
    }, user: s.user.username, categories: s.categories, offers: s.offers}#, galleries: s.galleries
      
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
      # if service_params[:galleries_attributes]
      #   galleries_urls_in_params = service_params[:galleries_attributes].map {|gallery| gallery["url"]}

      #   galleries_to_be_deleted = @service.galleries.map do |gallery|
      #     gallery unless galleries_urls_in_params.include? gallery.url
      #   end
      #   Gallery.delete(galleries_to_be_deleted) if galleries_to_be_deleted.any?
      # end
      # debugger

      if service_params[:category_services_attributes].any?
        categories_ids_in_params = service_params[:category_services_attributes].map {|category| category["category_id"].to_i}
        
        categories_to_be_deleted = @service.category_services.map do |category|
          category if !categories_ids_in_params.include? category.category_id
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
      params.require(:service).permit(:price_range, :location, :description, :name, medium: [], category_services_attributes: [:category_id])
    end
end
