require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

before do
  @purchase_address = FactoryBot.build(:@purchase_address)
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
    it '郵便番号が空では購入できない' do
      @purchase_address.postal = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal can't be blank")
    end

    it '都道府県が空では購入できない' do
      @purchase_address.prefecture_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture_id can't be blank")
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

    it "tokenが空では登録できないこと" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end

  end
end