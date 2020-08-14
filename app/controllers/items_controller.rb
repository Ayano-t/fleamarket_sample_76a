class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def show
    @item = Item.all.limit(5)
    @large_category = Largecategory.find(@item.large_category_id).name
    @middle_category = Middlecategory.find(@product.middle_category_id).name
    @small_category = Smallcategory.find(@product.small_category_id).name
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


end
