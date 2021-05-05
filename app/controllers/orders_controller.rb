class OrdersController < ApplicationController

  def index
  end

  def create
    if @order_buyer = OrderBuyer.new(order_params)
     @order_buyer.valid?
      @order_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city_name, :address, :building_name, :tell_number,  :item_id).merge(user_id: current_user.id)
  end
end
