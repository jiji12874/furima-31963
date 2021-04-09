require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

before do
  @user = FactoryBot.create(:user)
  @item = FactoryBot.create(:item)
  @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id , item_id: @item.id)
end

describe '商品購入機能' do
  context '商品購入がうまくいくとき' do
    it "priceとtokenがあれば保存ができること" do
      expect(@purchase_address).to be_valid
    end

    it '全ての値が入っている場合、登録できる' do
      expect(@purchase_address).to be_valid
    end
    
  end

  context '商品購入がうまくいかないとき' do
    it 'ユーザーのidが空では登録できないこと' do
      @purchase_address.user = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end

    it '商品のidが空では登録できないこと' do
      @purchase_address.item.id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end

    it '郵便番号が空では購入できない' do
      @purchase_address.postal = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal can't be blank")
    end

    it '郵便番号がハイフン無しでは登録できないこと' do
      @purchase_address.postal = '0000000'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal is invalid")
    end

    it '都道府県が空では購入できない' do
      @purchase_address.prefecture_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture_id can't be blank")
    end

    it '都道府県が1以外でないと登録できないこと' do
      @purchase_address.prefecture_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture_id is invalid")
    end

    it '市区町村が空では購入できない' do
      @purchase_address.city = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空では購入できない' do
      @purchase_address.addresses = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Addresses can't be blank")
    end

    it '電話番号が空では購入できない' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone_number can't be blank")
    end

    it '電話番号が12桁以上では登録できないこと' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone_number is invalid")
    end

    it '電話番号が英数混合では登録できないこと' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone_number is invalid")
    end

    it "tokenが空では登録できないこと" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end