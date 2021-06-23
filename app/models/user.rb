class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, format: {
      with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,
      message: "パスワードは英字と数字の両方を含めて設定してください"
     }
    with_options format: {
      with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
      message: "お名前(全角) は全角で入力して下さい"
    } do
      validates :last_name
      validates :first_name
    end
    with_options format: {
      with: /\A[ァ-ヶ]+\z/,
      message: "お名前カナ(全角) は全角カタカナのみで入力して下さい"
    } do
      validates :last_name_r
      validates :first_name_r
    end
  end

  has_many :items

end
