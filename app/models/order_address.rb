class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :house_num, :building, :phone_num, :token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は半角数字とハイフンで入力してください' }
    validates :prefecture_id, numericality: {other_than: 1, message: "を選択してください"}
    validates :city
    validates :house_num
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: 'は半角数字10〜11桁で入力してください' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_num: house_num, building: building, phone_num: phone_num, order_id: order.id)
  end

end