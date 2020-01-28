class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    @categories = Category.find(params[:id])
    render json: @categories
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
