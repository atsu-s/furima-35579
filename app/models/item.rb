class Item < ApplicationRecord

  with_options presence: true do
    validates :title, { length: {maximum: 40}}
    validates :text
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, format: { with: /\A[0-9]/}, message: 'は300円〜9,999,999円の間かつ半角数字で入力して下さい' }
    validates :image
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options numericality: { other_than: 1 } do
    validates :category_id, numericality: { other_than: 1 } 
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_charge_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :period_id, numericality: { other_than: 1 }
  end

    belongs_to :category
    belongs_to :status
    belongs_to :delivery_charge
    belongs_to :prefecture
    belongs_to :period
end
