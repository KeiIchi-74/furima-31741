require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録がうまくいく時" do
      it "nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかない時" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "重複したnicknameが存在した場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = @user.nickname
        another_user.email = "satou@satou.com"
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Nickname has already been taken")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在した場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.nickname = "satou"
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emialが@を含んでいなければ登録できない" do
        @user.email = "tanakatanaka.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "0000a"
        @user.password_confirmation = "0000a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字を含んでいなければ登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが半角英数字を含んでいなければ登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationの値が一致していなければ登録できない" do
        @user.password = "00000a"
        @user.password_confirmation = "00000b"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない" do
        @user.last_name = "tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない" do
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaが全角（カタカナ）での入力でなければ登録できない" do
        @user.last_name_kana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaが全角（カタカナ）での入力でなければ登録できない" do
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
