class ImagesController < ApplicationController
  def create
    Image.create(image_params)
  end

  private
  def image_params
    params.require(:image).permit(:image).merge(item_id: params[:item_id])
  end
end
