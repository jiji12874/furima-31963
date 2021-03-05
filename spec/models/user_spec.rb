require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context '新規登録がうまくいくとき' do
      it "全ての値が入っている場合、登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが存在すれば登録できる" do
        @user.nickname = "aaa"
        @user.valid?
      end
      it "passwordは半角英文字含む6文字以上であれば登録できる" do
        @user.password = "123aaa"
        @user.valid?
      end
      it "password_confirmationはpasswordと一致すると登録できる" do
        @user.password_confirmation = @user.password
        @user.valid?
      end
      it "birth_dateが入力されていると登録できる" do
        @user.birth_date = "1234-01-01"
        @user.valid?
      end
      it "苗字が漢字・平仮名・カタカナなら登録できる" do
        @user.last_name = "山田"
        @user.valid?
      end
      it "名前が漢字・平仮名・カタカナなら登録できる" do
        @user.first_name = "太郎"
        @user.valid?
      end
      it "苗字のカナが全角カタカナなら登録できる" do
        @user.last_name_kana = "ヤマダ"
        @user.valid?
      end
      it "名前のカナが全角カタカナなら登録できる" do
        @user.first_name_kana = "タロウ"
        @user.valid?
      end
    end

    context '新規登録がうまくいかないとき' do
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
       expect(@user.errors.full_messages).to include "Email is invalid"
     end
     it "重複したemailが存在する場合登録できないこと" do
       @user.save
       another_user = FactoryBot.build(:user, email: @user.email)
      
       another_user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it "パスワードが空では登録できない" do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "パスワードは、6文字以上でないと登録できない" do
       @user.password = "123aa"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
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
      @user.password = "AAAA１１"
      @user.password_confirmation = "AAAA１１"
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
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
     end
     it "漢字・平仮名・カタカナ以外では登録できない" do
      @user.last_name = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
     end
     it "last_nameが空だと登録できない。" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
     end
     it "漢字・平仮名・カタカナ以外では登録できない" do
      @user.first_name = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
     end
     it "first_nameが空だと登録できない。" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
     end
     it "全角カタカナ以外では登録できない" do
      @user.last_name_kana = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
     end
     it "last_name_kanaが空だと登録できない。" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
     end
     it "全角カタカナ以外では登録できない" do
      @user.first_name_kana = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
     end
     it "first_name_kanaが空だと登録できない。" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
     end
    end
  end
end
