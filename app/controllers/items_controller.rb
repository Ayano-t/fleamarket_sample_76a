class ItemsController < ApplicationController
  def index
    @items = Item.select(:image, :name, :price)
    # @images = Image.all
  end

  def show
    @items = Item.all
  end


  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :edit
    end
  end
end