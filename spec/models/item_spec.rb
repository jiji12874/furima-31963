require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it '全ての値が入っている場合、登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'カテゴリーの情報が空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態が空では登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it '配送料の負担についての情報が空では登録できない' do
        @item.cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost must be other than 1')
      end

      it '発送元の地域についての情報が空では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '発送までの日数についての情報が空では登録できない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 1')
      end

      it '価格についての情報が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲は、¥300~¥9,999,999の間でないと登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceは299円以下では登録できないこと' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      
      it 'priceは10,000,000以上では登録できないこと' do
        @item.price = '10,000,0001'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price is not a number")
      end

      it 'priceは半角数字のみでないと登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price is not a number")
      end

      it '販売価格は半角数字のみでないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
