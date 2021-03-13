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

      it '商品画像が存在すれば登録できる' do
        @item.image = 'aaa'
        @item.valid?
      end

      it '商品名が存在すれば登録できる' do
        @item.name = 'aaa'
        @item.valid?
      end

      it '商品の説明が存在すれば登録できる' do
        @item.info = 'aaa'
        @item.valid?
      end

      it 'カテゴリーの情報が存在すれば登録できる' do
        @item.category_id = '2'
        @item.valid?
      end

      it '商品の状態が存在すれば登録できる' do
        @item.status_id = '2'
        @item.valid?
      end

      it '配送料の負担についての情報が存在すれば登録できる' do
        @item.cost_id = '2'
        @item.valid?
      end

      it '発送元の地域についての情報が存在すれば登録できる' do
        @item.prefecture_id = '2'
        @item.valid?
      end

      it '発送までの日数についての情報が存在すれば登録できる' do
        @item.day_id = '2'
        @item.valid?
      end

      it '価格についての情報が存在すれば登録できる' do
        @item.price = '1000'
        @item.valid?
      end

      it '価格の範囲は、¥300~¥9,999,999の間であれば登録できる' do
        @item.price = '1000'
        @item.valid?
      end

      it '販売価格は半角数字のみであれば登録できる' do
        @item.price = '1000'
        @item.valid?
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
        @item.category_id = '1'
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
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は半角数字のみでないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
