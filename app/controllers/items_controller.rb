class ItemsController < ApplicationController
  def index   
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path
    else
      render :index
    end
    
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_burden_id, :delivery_area_id, :delivery_date_id, :price ).merge(user_id: current_user.id)
  end
end
