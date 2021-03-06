require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '商品を出品できるとき' do
      
        it 'image,titleとtext,category_idとstatus_id,delivery_charge_idとprefecture_id,period_idとprice,が存在すれば出品できる' do
          expect(@item).to be_valid
        end

        it 'priceは半角数字だと登録できる' do
          @item.price = 300
          expect(@item).to be_valid
        end
      end

      context '商品を出品できないとき' do
        
        it 'imageが空だと出品できない'do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'titleが空だと出品できない' do
          @item.title = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end

        it 'titleが40文字を超えると登録できない' do
          @item.title = "a" * 41
          @item.valid?
          expect(@item.errors.full_messages).to include("Title is too long (maximum is 40 characters)")
        end

        it 'textが空だと登録できない' do
          @item.text = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end

        it 'category_idが1だと出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it 'status_idが1だと出品できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end

        it 'delivery_charge_idが1だと出品できない' do
          @item.delivery_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
        end

        it 'prefecture_idが1だと登録できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end

        it 'period_idが1だと登録できない' do
          @item.period_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Period must be other than 1")
        end

        it 'priceが空だと出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'priceが300円より小さいと出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は300円〜9,999,999円の間かつ半角数字で整数値のみ入力して下さい")
        end

        it 'priceが9,999,999円より大きいと出品できない' do
          @item.price = 10,000,000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は300円〜9,999,999円の間かつ半角数字で整数値のみ入力して下さい")
        end

        it 'priceに小数が含まれれいると登録できない' do
          @item.price =300.5
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は300円〜9,999,999円の間かつ半角数字で整数値のみ入力して下さい")
        end

        it 'priceは半角数字混合だと登録できない' do
          @item.price ='a1a'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は300円〜9,999,999円の間かつ半角数字で整数値のみ入力して下さい")
        end

        it 'priceは全角文字だと登録できない' do
          @item.price = '１あ'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は300円〜9,999,999円の間かつ半角数字で整数値のみ入力して下さい")
        end

        it 'userが紐付いていないと登録できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
      end
    end
  end
end
