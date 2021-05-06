class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_root, only: [:index, :create]

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
    params.require(:order_buyer).permit(:postal_code, :prefecture_id, :city_name, :address, :building_name, :tell_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.price)
  end

  def set_item
    @item = Item.find_by(id: params[:item_id])
  end

  def redirect_root
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end
end
