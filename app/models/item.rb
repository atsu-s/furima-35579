class Item < ApplicationRecord

  validates :title, { presence: true, length: {maximum: 40}}
  validates :text, presence: true
  validates :price, { presence: true, numericality: { in: 300..9999999 }}
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_charge
    belongs_to :prefecture
    belongs_to :period

    validates :category_id, numericality: { other_than: 1 } 
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_charge_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :period_id, numericality: { other_than: 1 }
end
