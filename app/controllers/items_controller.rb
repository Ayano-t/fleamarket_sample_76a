class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    @items = Item.all.limit(5)
    @items = Item.order("created_at DESC")
    # @items = Item.select(:image, :name, :price)
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

  def show
    @image = @item.images
    @grand_child_category = @item.category
    @child_category = @grand_child_category.parent
    @parent_category = @child_category.parent
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def search
    @items = Item.search(params[:keyword]).limit(40).order("created_at DESC")
    @keyword = params[:keyword]
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :description, :brand, :condition, :status, :shipping_costs, :shipping_from, :shipping_date, :price, :category_id, images_attributes: [:src]).merge(user_id: current_user.id)
  end
end
