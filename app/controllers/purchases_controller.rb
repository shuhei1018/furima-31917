class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_root, only: [:index]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:postalcode, :prefecture_id, :municipality, :house_number, :building_name, :phonenumber).merge(user_id: current_user.id, item_id:params[:item_id])
  end

  def move_to_root
    redirect_to root_path if current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
