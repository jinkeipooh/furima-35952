require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報と送付先の登録' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1       ###テストへの負荷大きいため速度を遅くする （read_time以内に処理が終わらないかった? => beforeアクションはit~endの処理ごと毎回呼ばれるので、毎回DBへの保存処理を行っているため処理が重くなる）
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank", "Post code は半角数字とハイフンで入力してください")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code は半角数字とハイフンで入力してください")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture を選択してください")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numが空だと保存できないこと' do
        @order_address.house_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House num can't be blank")
      end
      it 'phone_numが空だと保存できないこと' do
        @order_address.phone_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num can't be blank", "Phone num は半角数字10〜11桁で入力してください")
      end
      it 'phone_numが９桁以下だと保存できないこと' do
        @order_address.phone_num = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num は半角数字10〜11桁で入力してください")
      end
      it 'phone_numが12桁以上だと保存できないこと' do
        @order_address.phone_num = '123456789123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num は半角数字10〜11桁で入力してください")
      end
      it 'phone_numが全角だと保存できないこと' do
        @order_address.phone_num = '全角文字'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num は半角数字10〜11桁で入力してください")
      end
      it 'phone_numが半角英字だと保存できないこと' do
        @order_address.phone_num = 'hankakueiji'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num は半角数字10〜11桁で入力してください")
      end
      it 'user_idが空だと保存できないこと' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと登録できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end