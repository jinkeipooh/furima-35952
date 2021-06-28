class OrderAddress
  include ActiveModel::module
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :house_num, :building, :phone_num, :order_id
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :house_num
    validates :phone_num
    validates :order_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_num: house_num, phone_num: phone_num, order_id: order.id)
  end

end