class PurchasesController < ApplicationController
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:postalcode, :prefecture_id, :municipality, :house_number, :building_name, :phonenumber).merge(user_id: current_user.id, item_id:params[:item_id])
  end
end
