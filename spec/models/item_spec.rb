require 'rails_helper'
 RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品機能" do
    context '商品出品できるとき' do
      it "name,text,category_id,condition_id,charge_id,prefecture_id,day_id,price,user_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "category_idが1以外なら登録できる" do
      end
      it "condition_idが1以外なら登録できる" do
      end
      it "charge_idが1以外なら登録できる" do
      end
      it "prefecture_idが1以外なら登録できる" do
      end
      it "day_idが1以外なら登録できる" do
      end
      it "priceが半角数値なら登録できる" do
      end
    end
    context '商品出品できないとき' do
      it "imageが空では登録できない" do
      end
      it "nameが空では登録できない" do
      end
      it "textが空では登録できない" do
      end
      it "category_idが空では登録できない" do
      end
      it "condition_idが空では登録できない" do
      end
      it "charge_idが空では登録できない" do
      end
      it "prefecture_idが空では登録できない" do
      end
      it "day_idが空では登録できない" do
      end
      it "priceが空では登録できない" do
      end
      it "user_idが空では登録できない" do
      end
        #  かぶってるかな？いらないか？
      it "category_idが1だと登録できない" do
      end
      it "condition_idが1だと登録できない" do
      end
      it "charge_idが1だと登録できない" do
      end
      it "prefecture_idが1だと登録できない" do
      end
      it "day_idが1だと登録できない" do
      end
        #  //かぶってるかな
      it "priceが半角でなければ登録できない" do
      end
      it "priceが300未満は登録できない" do
      end
      it "priceが9999999より大きい値は登録できない" do
      end
    end
  end
 end
