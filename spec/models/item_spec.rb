require 'rails_helper'
 RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品機能" do
    context '商品出品できるとき' do
      it "image,name,text,category_id,condition_id,charge_id,prefecture_id,day_id,price,user_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "category_idが1以外なら登録できる" do
        @item.category_id = '2'
        expect(@item).to be_valid
      end
      it "condition_idが1以外なら登録できる" do
        @item.condition_id = '2'
        expect(@item).to be_valid
      end
      it "charge_idが1以外なら登録できる" do
        @item.charge_id = '2'
        expect(@item).to be_valid
      end
      it "prefecture_idが1以外なら登録できる" do
        @item.prefecture_id = '2'
        expect(@item).to be_valid
      end
      it "day_idが1以外なら登録できる" do
        @item.day_id = '2'
        expect(@item).to be_valid
      end
      it "priceが半角数値なら登録できる" do
        @item.price = '50000'
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "nameが空では登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "textが空では登録できない" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank" 
      end
      it "category_idが空では登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank", "Category を選択してください"
      end
      it "condition_idが空では登録できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank", "Condition を選択してください"
      end
      it "charge_idが空では登録できない" do
        @item.charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge can't be blank", "Charge を選択してください"
      end
      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank", "Prefecture を選択してください"
      end
      it "day_idが空では登録できない" do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank", "Day を選択してください"
      end
      it "priceが空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank", "Price は300~9999999円の間で入力してください", "Price は半角数字のみで入力してください"
      end
      it "user_idが空では登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
      it "category_idが1だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category を選択してください"
      end
      it "condition_idが1だと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition を選択してください"
      end
      it "charge_idが1だと登録できない" do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge を選択してください"
      end
      it "prefecture_idが1だと登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture を選択してください"
      end
      it "day_idが1だと登録できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Day を選択してください"
      end
      it "priceが全角文字では登録できない" do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は300~9999999円の間で入力してください"
      end
      it "priceが300未満は登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は300~9999999円の間で入力してください"
      end
      it "priceが9999999より大きい値は登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は300~9999999円の間で入力してください"
      end
      it "priceが半角英数字混合では登録できない" do
        @item.price = '100aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は300~9999999円の間で入力してください"
      end
      it "priceが半角英字のみでは登録できない" do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は300~9999999円の間で入力してください"
      end
    end
  end
 end
