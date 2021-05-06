require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do

      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_buyer).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと購入できない' do
        @order_buyer.postal_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のみでハイフンを含んでいないと購入できない' do
        @order_buyer.postal_code = 'あああああ'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include ("Postal code は半角数字のみで-(ハイフン)を含めて下さい")
      end

      it 'prefecture_idが1だと購入できない' do
        @order_buyer.prefecture_id = 1
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'city_nameが空だと購入できない' do
        @order_buyer.city_name = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("City name can't be blank")
      end

      it 'addressが空だと購入できない' do
        @order_buyer.address = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Address can't be blank")
      end

      it 'building_nameは空でも購入できる' do
        @order_buyer.building_name = ''
        expect(@order_buyer).to be_valid
      end

      it 'tell_numberが空だと購入できない' do
        @order_buyer.tell_number = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Tell number can't be blank")
      end

      it 'tell_numberが12桁以上だと購入できない' do
        @order_buyer.tell_number = '000000000000'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Tell number is too long (maximum is 11 characters)")
      end
    end
  end
end