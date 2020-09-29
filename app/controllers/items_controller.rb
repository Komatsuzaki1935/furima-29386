class ItemsController < ApplicationController
  def index
  end

  def show
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

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :condition_id, :shipping_charge_id, :shipping_from_id, :shipping_day_id, user_ids:[])
  end
end
