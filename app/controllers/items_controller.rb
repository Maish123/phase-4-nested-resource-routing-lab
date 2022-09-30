class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = get_user
      items = uer.items
    else
      items = Item.all
    end
    render json: items, include: :user
  end

  def show
    item = Item.find_by(id:params[:id])
    if item
      render json: item
  end

  def create
    user = get_user
    item = user.items.create(item_params)
    render json: item, status: :created
  end

  private
  def item_params
    params.permit(:name, :description, :price)
  end

  def get_user
    User.find(params[:user_id])
  end


end
