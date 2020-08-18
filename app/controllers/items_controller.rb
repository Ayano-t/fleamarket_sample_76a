class ItemsController < ApplicationController
  def index
    @items = Item.all.limit(5)
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.all.limit(5)
    # @large_category = Largecategory.find(@item.large_category_id).name
    # @middle_category = Middlecategory.find(@product.middle_category_id).name
    # @small_category = Smallcategory.find(@product.small_category_id).name
  end

  

  def destroy
    @item.destroy
    redirect_to root_path
  end


end
