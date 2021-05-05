class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_buyer = OrderBuyer.new
  end

  def create
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
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

  def set_item
    @item = Item.find_by(id: params[:item_id])
  end
end
