require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
   describe "ユーザー新規登録" do
     context '新規登録できるとき' do
       it "email,password,password_confirmation,nickname,last_name,first_name,last_name_r,first_name_r,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
       end
       it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
        @user.password = '1a1a1a'
        @user.password_confirmation = '1a1a1a'
        expect(@user).to be_valid
       end
       it "last_nameが全角なら登録できる" do
        @user.last_name = '全角名前'
        expect(@user).to be_valid
       end
       it "first_nameが全角なら登録できる" do
        @user.last_name = '全角名字'
        expect(@user).to be_valid
       end
       it "last_name_rが全角カナなら登録できる" do
        @user.last_name = 'カナナマエ'
        expect(@user).to be_valid
       end
       it "first_name_rが全角カナなら登録できる" do
        @user.last_name = 'カナミョウジ'
        expect(@user).to be_valid
       end
     end

     context '新規登録できないとき' do
       it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
       end
       it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
       end
       it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
       end
       it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
       end
       it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
       end
       it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
       end
       it "last_name_rが空だと登録できない" do
        @user.last_name_r = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name r can't be blank"
       end
       it "first_name_rが空だと登録できない" do
        @user.first_name_r = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name r can't be blank"
       end
       it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
       end
       it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
       end
       it "emailに＠が含まれていないと登録できない" do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
       end
       it "passwordが5文字以下だと登録できない" do
        @user.password = '33a'
        @user.password_confirmation = '33a' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
       end
       it "passwordが半角数字のみの場合は登録できない" do
        @user.password = '000000'
        @user.password_confirmation = '000000' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password パスワードは英字と数字の両方を含めて設定してください"
       end
       it "passwordが半角英字のみの場合は登録できない" do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password パスワードは英字と数字の両方を含めて設定してください"
       end
       it "passwordが全角の場合は登録できない" do
        @user.password = '全角文字パス'
        @user.password_confirmation = '全角文字パス' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password パスワードは英字と数字の両方を含めて設定してください"
       end
       it "last_nameが全角以外は登録できない" do
        @user.last_name = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name は全角で入力して下さい"
       end
       it "first_nameが全角以外は登録できない" do
        @user.first_name = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name は全角で入力して下さい"
       end
       it "last_name_rが全角でないと登録できない" do
        @user.last_name_r = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name r は全角カタカナのみで入力して下さい"
       end
       it "first_name_rが全角でないと登録できない" do
        @user.first_name_r = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name r は全角カタカナのみで入力して下さい"
       end
       it "last_name_rがカタカナでないと登録できない" do
        @user.last_name_r = 'かたかな'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name r は全角カタカナのみで入力して下さい"
       end
       it "first_name_rがカタカナでないと登録できない" do
        @user.first_name_r = 'かたかな'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name r は全角カタカナのみで入力して下さい"
       end
     end
   end
 end
