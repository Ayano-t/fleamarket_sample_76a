class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("---")
  end

  def create
    @item = Item.new(item_params)
    @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("---")
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :description, :brand, :condition, :status, :shipping_costs, :shipping_from, :shipping_date, :price, :category_id, images_attributes: [:src])
  end
