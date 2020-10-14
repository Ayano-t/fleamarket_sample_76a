class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def destroy
  end

  def buy
    @user = User.find(params[:id])
    @item = Item.find(params[:item_id])
    @address = @user.address
  end
end
