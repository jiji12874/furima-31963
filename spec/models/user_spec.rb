require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
   describe "ユーザー新規登録" do
     it "nicknameが空では登録できない" do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end
     it "emailが空では登録できない" do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Email can't be blank"
     end
     it "emailが@を含まないと登録できない" do
       @user.email = 'sample.com'
       @user.valid?
       expect(@user.errors.full_messages).to include('Email is invalid')
     end
     it "重複したemailが存在する場合は登録できないこと" do
       @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it "パスワードが空では登録できない" do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "パスワードは、6文字以上でないと登録できない" do
       @user.password = "123aaa"
       @user.valid?
       expect(@user).to be_valid
     end
     it "passwordが半角英文字なしでは登録できない" do
       @user.password = "123456"
       @user.password_confirmation = "123456"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it "passwordが半角数字なしでは登録できない" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが全角では登録できない" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
     it "password_confirmationが空では登録できないこと" do
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "birth_dateが空では登録できないこと" do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank", "Birth date is invalid")
    end
     it "漢字・平仮名・カタカナ以外では登録できない" do
      @user.last_name = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
     end
     it "漢字・平仮名・カタカナ以外では登録できない" do
      @user.first_name = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
     end
     it "全角カタカナ以外では登録できない" do
      @user.last_name_kana = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
     end
     it "全角カタカナ以外では登録できない" do
      @user.first_name_kana = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
     end
   end
 end

