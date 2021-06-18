class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,  presence: true
  validates :last_name,  presence: true, format: {
    with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
    message: "全角で入力して下さい"
  }
  validates :last_name_r,  presence: true, format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }
  validates :first_name,  presence: true, format: {
    with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
    message: "全角で入力して下さい"
  }
  validates :first_name_r,  presence: true, format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }
  validates :birthday,  presence: true

  # validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  # validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  # validates :last_name_r, format: { with: /\p{katakana}/ }
  # validates :first_name_r, format: { with: /\p{katakana}/ }
end


/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/