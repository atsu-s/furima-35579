class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  validates :family_name, presence: true, format: { with: /\A[ｧ-ﾝﾞﾟァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい"}
  validates :first_name, presence: true, format: { with: /\A[ｧ-ﾝﾞﾟァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい"}
  validates :birth_day, presence: true
  validates :encrypted_password, :password, :password_confirmation, length:{minimum: 6}, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "は半角英数混合で入力して下さい"}
end
