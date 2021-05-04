class BuyersController < ApplicationController

  def index
  end

  def new
    @buyer_order = BuyerOrder.new
  end

  def create
    @buyer_order = BuyerOrder.new(buyer_params)
    if @buyer_order.valid?
      @buyer_order.save
      redirect_to root_path
    else
      render :new
    end
  end

  

  private

  def buyer_params
    params.require(:buyer_order).permit(:postal_code, :prefecture_id, :city_name, :address, :building_name, :tell_number, :order_id)
  end
end
