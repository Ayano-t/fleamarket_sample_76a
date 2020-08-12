class ItemsController < ApplicationController
  before_action :set_categories, only: [:show]
  
  
  def index
    @items = Item.all
  end

  def show
    @item = Item.all.limit(5)
    @large_category = Largecategory.find(@item.large_category_id).name
    @middle_category = Middlecategory.find(@product.middle_category_id).name
    @small_category = Smallcategory.find(@product.small_category_id).name
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_categories
    @large_category = Largecategory.all
    @middle_category = Middlecategory.all
    @small_category = Smallcategory.all
  end


end
