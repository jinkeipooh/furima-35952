class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,  presence: true
  validates :last_name,  presence: true
  validates :last_name_r,  presence: true
  validates :first_name,  presence: true
  validates :first_name_r,  presence: true
  validates :birthday,  presence: true

  # validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  # validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  # validates :last_name_r, format: { with: /\p{katakana}/ }
  # validates :first_name_r, format: { with: /\p{katakana}/ }
end
