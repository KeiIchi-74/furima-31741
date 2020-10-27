require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "商品の情報が保存される時" do
      it "image、name、info、category_id、sales_status_id、shipping_fee_id、prefecture_id、scheduled_delivery_id、priceが存在し、userが紐付いていれば保存される" do
        expect(@item).to be_valid
      end
    end

    context "商品の情報が保存されない時" do
      it "imageが空だと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと保存できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが40字より多いと保存できない" do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "infoが空だと保存できない" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it "infoが1000字より多いと保存できない" do
        @item.info = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Info is too long (maximum is 1000 characters)")
      end
      it "category_idが1だと保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "sales_status_idが1だと保存できない" do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status Select")
      end
      it "shipping_fee_idが1だと保存できない" do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee Select")
      end
      it "prefecture_idが1だと保存できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it "scheduled_delivery_idが1だと保存できない" do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery Select")
      end
      it "priceが空だと保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角（漢字）だと保存できない" do
        @item.price = "漢字"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "priceが全角（ひらがな）だと保存できない" do
        @item.price = "漢字"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "priceが全角（カタカナ）だと保存できない" do
        @item.price = "カタカナ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "priceが全角数字だと保存できない" do
        @item.price = "１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "priceが全角記号だと保存できない" do
        @item.price = "＠＠＠＠"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "priceが半角英字だと保存できない" do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "priceが半角記号だと保存できない" do
        @item.price = "@@@@"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "priceが300より小さい数値だと保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが9999999より大きい数値だと保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "userが紐付いていないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
