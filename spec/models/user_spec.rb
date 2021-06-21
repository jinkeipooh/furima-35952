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
        @user.password = '000000'
        @user.password_confirmation = '000000'
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
       end
       it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
       end
       it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank", "Last name 全角で入力して下さい"
       end
       it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank", "First name 全角で入力して下さい"
       end
       it "last_name_rが空だと登録できない" do
        @user.last_name_r = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name r can't be blank", "Last name r 全角カタカナのみで入力して下さい"
       end
       it "first_name_rが空だと登録できない" do
        @user.first_name_r = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name r can't be blank", "First name r 全角カタカナのみで入力して下さい"
       end
       it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
       end
       it "passwordが5文字以下だと登録できない" do
        @user.password = '333'
        @user.password_confirmation = '333' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
       end
       it "last_nameが全角以外は登録できない" do
        @user.last_name = 'aga'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角で入力して下さい"
       end
       it "first_nameが全角以外は登録できない" do
        @user.first_name = 'aga'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角で入力して下さい"
       end
       it "last_name_rが全角カナ以外は登録できない" do
        @user.last_name_r = 'aga'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name r 全角カタカナのみで入力して下さい"
       end
       it "first_name_rが全角カナ以外は登録できない" do
        @user.first_name_r = 'aga'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name r 全角カタカナのみで入力して下さい"
       end
     end
   end
 end










#  describe 'ユーザー新規登録' do
#   context '新規登録できるとき' do
#     it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
#       expect(@user).to be_valid
#     end
#     it 'nicknameが6文字以下であれば登録できる' do
#       @user.nickname = 'aaaaaa'
#       expect(@user).to be_valid
#     end
#     it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
#       @user.password = '000000'
#       @user.password_confirmation = '000000'
#       expect(@user).to be_valid
#     end
#   end
#   context '新規登録できないとき' do
#     it 'nicknameが空では登録できない' do
#       @user.nickname = ''
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Nickname can't be blank")
#     end
#     it 'emailが空では登録できない' do
#       @user.email = ''
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Email can't be blank")
#     end
#     it 'passwordが空では登録できない' do
#       @user.password = ''
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Password can't be blank")
#     end
#     it 'passwordが存在してもpassword_confirmationが空では登録できない' do
#       @user.password_confirmation = ''
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
#     end
#     it 'nicknameが7文字以上では登録できない' do
#       @user.nickname = 'aaaaaaa'
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 6 characters)")
#     end
#     it '重複したemailが存在する場合登録できない' do
#       @user.save
#       another_user = FactoryBot.build(:user)
#       another_user.email = @user.email
#       another_user.valid?
#       expect(another_user.errors.full_messages).to include("Email has already been taken")
#     end
#     it 'passwordが5文字以下では登録できない' do
#       @user.password = '00000'
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
#     end
#   end
# end