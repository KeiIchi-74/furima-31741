require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do 
    @order_form = FactoryBot.build(:order_form)
  end

  describe "購入情報の保存" do
    context "購入情報が保存される時" do
      it "token、postal_code、prefecture_id、city、house_number、building_name、phone_numberが存在していれば保存できること" do
        expect(@order_form).to be_valid
      end
      it "building_nameは空でも保存できること" do
        @order_form.building_name = ""
        expect(@order_form).to be_valid
      end
    end

    context "購入情報が保存されない時" do
      it "tokenが空だと保存できないこと" do
        @order_form.token = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空だと保存できないこと" do
        @order_form.postal_code = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが半角のハイフンを含んでいないと保存できないこと" do
        @order_form.postal_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
      end
      it "postal_codeが全角（漢字）だと保存できないこと" do
        @order_form.postal_code = "壱"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
      end
      it "postal_codeが全角（ひらがな）だと保存できないこと" do
        @order_form.postal_code = "いち"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
      end
      it "postal_codeが全角（カタカナ）だと保存できないこと" do
        @order_form.postal_code = "イチ"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
      end
      it "postal_codeが全角数字だと保存できないこと" do
        @order_form.postal_code = "１２３４５６７"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
      end
      it "postal_codeが全角記号だと保存できないこと" do
        @order_form.postal_code = "＠＠＠＠＠＠＠"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
      end
      it "postal_codeが半角英字だと保存できないこと" do
        @order_form.postal_code = "one"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
      end
      it "postal_codeが半角記号だと保存できないこと" do
        @order_form.postal_code = "@@@@@@@"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
      end
      it "prefecture_idが1だと保存できないこと" do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture Select")
      end
      it "cityが空だと保存できないこと" do
        @order_form.city = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空だと保存できないこと" do
        @order_form.house_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空だと保存できないこと" do
        @order_form.phone_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが全角（漢字）だと保存できないこと" do
        @order_form.phone_number = "壱"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが全角（ひらがな）だと保存できないこと" do
        @order_form.phone_number = "いち"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが全角（カタカナ）だと保存できないこと" do
        @order_form.phone_number = "イチ"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが全角数字だと保存できないこと" do
        @order_form.phone_number = "０８０１２３４５６７８"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが全角記号だと保存できないこと" do
        @order_form.phone_number = "＠＠＠＠＠＠＠＠＠＠＠"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが半角英字だと保存できないこと" do
        @order_form.phone_number = "one"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが半角記号だと保存できないこと" do
        @order_form.phone_number = "@@@@@@@@@@@"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end
