class OrderBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city_name, :address, :building_name, :tell_number, :order_id, :user_id, :token, :price

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "は半角数字のみで-(ハイフン)を含めて下さい"}
    validates :city_name
    validates :address
    validates :tell_number, format: { with: /\A\d{10,11}\z/, message: "は半角数字のみで11桁で入力して下さい"}
  end
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :token, presence:{ message: "はカード情報を正しく入力して下さい"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Buyer.create(postal_code: postal_code, prefecture_id: prefecture_id, city_name: city_name, address: address, building_name: building_name, tell_number: tell_number, order_id: order.id)
  end
end