class ItemsController < ApplicationController
  def index
    @items = Item.all.limit(5)
    @items = Item.order("created_at DESC")
    # @items = Item.select(:image, :name, :price)
  end

  def show
    @items = Item.all.limit(5)
  end


  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :edit
    end
  end

  # def purchase
  #   @item_buyer = item.find(params[:id])
  #   # @item_buyer.
  # end

end