class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
    # @item = Item.all
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:id, :image, :name, :explanation, :price, :category_id, :condition_id, :shipping_charge_id, :shipping_from_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = item.find(params[:id])
  end
end
