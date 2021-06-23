class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :day
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }  #300~9999999かつ
    validates :price,format: { with: /\A[0-9]+\z/i, message: "is invalid. Input half-width characters."} #半角数値のみ登録可能
    with_options numericality: {other_than: 1} do
      validates :category_id
      validates :condition_id
      validates :charge_id
      validates :prefecture_id
      validates :day_id
    end
  end

  
end
