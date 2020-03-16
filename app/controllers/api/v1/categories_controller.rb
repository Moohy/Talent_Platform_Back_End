class Api::V1::CategoriesController < ApiController
  load_and_authorize_resource
  def index
    @categories = Category.all
    @categories_hash = @categories.map do |c|
      service_hash = c.services.map do |s|
        {service: s, medium: s.medium.map { |media|
        media.as_json.merge({ media: url_for(media) })
      }}#, galleries: s.galleries}
      end
      {category: c, services: service_hash}
    end
    render json: @categories_hash
  end

  def show
    @category = Category.find(params[:id])
    @services = @category.services
    render json: {category: @category,services: @services}
  end

  def edit
    @categories = Category.find(params[:id])
  end

  def update
    @categories = Category.find(params[:id])
    # @categories.update(params.require(:categories)
    if @categories.update(category_params)
      render json: ' Category Updated !'
      
    else
      render json: 'categories has not Updated'
    end
  end

  def create
    @categories = Category.new(category_params)


  if @categories.save
    render json: 'categories has been Created !'
    
  else
    render json: 'categories isnt Created'
  end

  end

  def destroy
    @categories = Category.find(params[:id])
    if @categories.present?
      @categories.destroy
      render json: 'categories has been Deleted !'
      
    end
    
  end



  private

  def category_params
    params.require(:category).permit(:name)
    end
end
