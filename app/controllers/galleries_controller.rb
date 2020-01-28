class GalleriesController < ApplicationController
  def create
    @service = Service.find(params[:service_id])
    @gallery = @service.galleries.new(gallery_params)
    if @gallery.save
      render json: 'gallery has been Created !'
      
    else
      render json: 'gallery has not been Created'
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    # @gallery.update(params.require(:gallery)
    if @gallery.update(gallery_params)
      render json: ' Gallery Updated !'
      
    else
      render json: 'gallery has not been Updated'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    if @gallery.present?
      @gallery.destroy
      render json: 'gallery has been Deleted !'
      
    end
    
  end



  private

  def gallery_params
    params.require(:gallery).permit(:url) 
  end

end
