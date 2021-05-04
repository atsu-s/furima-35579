class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_day
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "は全角漢字、ひらがな、カタカナのみ入力して下さい"} do
    validates :family_name_kanji
    validates :first_name_kanji
  end
  
  with_options presence: true, format: { with: /\A[ｧ-ﾝﾞﾟァ-ヶー－]+\z/, message: "は全角カタカナのみ入力して下さい"} do
    validates :family_name
    validates :first_name
  end

  validates :password, format:{ with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i , message: "は半角英数のみ混合で入力して下さい"}

  has_many :items
  has_many :orders

end